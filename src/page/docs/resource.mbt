// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
priv enum BuildStatus {
  BuildSuccess
  BuildLegacy
  BuildQueued
  BuildFailed
}

///|
priv struct MetaInfo {
  name : String
  author : String
  version : String
  license : String?
  keywords : Array[String]
  description : String?
  repository : String?
  deps : Array[(String, String)]
  build_status : BuildStatus?
  downloads : Int
}

///|
priv struct ResourceInfo {
  readme_content : String
  source_files : Array[String]
}

///|
/// Normalizes repository URLs so links stay clickable.
fn normalize_repo_url(url : String) -> String {
  match url {
    [.. "https://", ..] | [.. "http://", ..] => url
    [.. "git@", .. remain] if remain.contains_char(':') &&
      remain.split(":").collect().length() == 2 => url
    _ => "https://\{url}"
  }
}

///|
fn empty_string_as_none(s : String) -> String? {
  if s.is_empty() {
    None
  } else {
    Some(s)
  }
}

///|
fn decode_optional_string(
  json : Json?,
  path : @json.JsonPath,
) -> String? raise @json.JsonDecodeError {
  match json {
    Some(String(s)) => empty_string_as_none(s)
    Some(Null) | None => None
    _ => raise JsonDecodeError((path, "invalid optional string field"))
  }
}

///|
fn decode_keywords(
  json : Json?,
  path : @json.JsonPath,
) -> Array[String] raise @json.JsonDecodeError {
  match json {
    Some(Array(keywords)) =>
      keywords.filter_map(fn(x) {
        match x {
          String(s) if !s.is_empty() => Some(s)
          _ => None
        }
      })
    Some(Null) | None => []
    _ => raise JsonDecodeError((path, "invalid keywords field"))
  }
}

///|
fn decode_deps(
  json : Json?,
  path : @json.JsonPath,
) -> Array[(String, String)] raise @json.JsonDecodeError {
  match json {
    Some(Object(xs)) => {
      let deps = []
      for entry in xs.iter2().to_array() {
        match entry {
          (name, String(version)) => deps.push((name, version))
          _ => raise JsonDecodeError((path, "invalid deps field"))
        }
      }
      deps
    }
    Some(Null) | None => []
    _ => raise JsonDecodeError((path, "invalid deps field"))
  }
}

///|
fn decode_build_status(
  json : Json?,
  path : @json.JsonPath,
) -> BuildStatus? raise @json.JsonDecodeError {
  match json {
    Some(String("success")) => Some(BuildSuccess)
    Some(String("legacy")) => Some(BuildLegacy)
    Some(String("queued")) => Some(BuildQueued)
    Some(String("failed")) => Some(BuildFailed)
    Some(Null) | None => None
    Some(String(_)) => None
    _ => raise JsonDecodeError((path, "invalid build_status field"))
  }
}

///|
fn find_version_build_status(
  json : Json?,
  current_version : String,
  path : @json.JsonPath,
) -> BuildStatus? raise @json.JsonDecodeError {
  match json {
    Some(Array(versions)) => {
      for version_entry in versions {
        match version_entry {
          { "version": String(version), "build_status"? : build_status, .. } if version ==
            current_version => return decode_build_status(build_status, path)
          { "version": String(version), .. } if version == current_version =>
            return None
          _ => ()
        }
      }
      None
    }
    Some(Null) | None => None
    _ => raise JsonDecodeError((path, "invalid versions field"))
  }
}

///|
fn build_meta_info(
  name : String,
  version : String,
  repository : String?,
  license : String?,
  description : String?,
  keywords : Array[String],
  deps : Array[(String, String)],
  build_status : BuildStatus?,
  downloads : Int,
) -> MetaInfo {
  let author = String::from_array(
    name.iter().take_while(c => c != '/').collect(),
  )
  {
    author,
    name,
    description,
    version,
    license,
    repository: repository.map(normalize_repo_url),
    keywords,
    deps,
    build_status,
    downloads,
  }
}

///|
fn decode_module_meta(
  json : Json,
  current_version : String,
  path : @json.JsonPath,
) -> MetaInfo raise @json.JsonDecodeError {
  match json {
    {
      "metadata": {
        "name": String(name),
        "version": String(version),
        "repository"? : repository,
        "license"? : license,
        "description"? : description,
        "keywords"? : keywords,
        "deps"? : deps,
        "build_status"? : metadata_build_status,
        ..
      },
      "versions"? : versions,
      "build_status"? : top_level_build_status,
      "downloads"? : downloads_json,
      ..
    } => {
      let downloads = match downloads_json {
        Some(Number(n, ..)) => n.to_int()
        _ => 0
      }
      let build_status = match
        find_version_build_status(versions, current_version, path) {
        Some(status) => Some(status)
        None =>
          match decode_build_status(metadata_build_status, path) {
            Some(status) => Some(status)
            None => decode_build_status(top_level_build_status, path)
          }
      }
      build_meta_info(
        name,
        version,
        decode_optional_string(repository, path),
        decode_optional_string(license, path),
        decode_optional_string(description, path),
        decode_keywords(keywords, path),
        decode_deps(deps, path),
        build_status,
        downloads,
      )
    }
    _ => raise JsonDecodeError((path, "invalid module metadata"))
  }
}

///|
fn decode_source_files(
  json : Json?,
  path : @json.JsonPath,
) -> Array[String] raise @json.JsonDecodeError {
  match json {
    Some(Array(files)) => {
      let source_files = []
      for file in files {
        match file {
          String(source_path) => source_files.push(source_path)
          _ => raise JsonDecodeError((path, "invalid source_files field"))
        }
      }
      source_files
    }
    Some(Null) | None => []
    _ => raise JsonDecodeError((path, "invalid source_files field"))
  }
}

///|
impl @json.FromJson for ResourceInfo with from_json(json : Json, path) {
  match json {
    {
      "readme_content": String(readme_content),
      "source_files"? : source_files,
      ..
    } =>
      { readme_content, source_files: decode_source_files(source_files, path) }
    _ => raise JsonDecodeError((path, "invalid resource.json"))
  }
}
