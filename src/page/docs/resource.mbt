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
}

///|
/// Normalizes repository URLs so links stay clickable.
fn normalize_repo_url(url : String) -> String {
  match url {
    [.. "https://", ..] | [.. "http://", ..] => url
    [.. "git@", .. remain] if remain.contains_char(':') &&
      remain.split(":").collect().length() == 2 => url
    _ => "https://" + url
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
fn decode_optional_string(json : Json?) -> String? raise Error {
  match json {
    Some(String(s)) => empty_string_as_none(s)
    Some(Null) | None => None
    _ => fail("invalid optional string field")
  }
}

///|
fn decode_keywords(json : Json?) -> Array[String] raise Error {
  match json {
    Some(Array(keywords)) =>
      keywords.filter_map(fn(x) {
        match x {
          String(s) if !s.is_empty() => Some(s)
          _ => None
        }
      })
    Some(Null) | None => []
    _ => fail("invalid keywords field")
  }
}

///|
fn decode_deps(json : Json?) -> Array[(String, String)] raise Error {
  match json {
    Some(Object(xs)) =>
      map_with_error(xs.iter2().to_array(), entry => {
        match entry {
          (name, String(version)) => (name, version)
          _ => fail("invalid deps field")
        }
      })
    Some(Null) | None => []
    _ => fail("invalid deps field")
  }
}

///|
fn decode_build_status(json : Json?) -> BuildStatus? raise Error {
  match json {
    Some(String("success")) => Some(BuildSuccess)
    Some(String("legacy")) => Some(BuildLegacy)
    Some(String("queued")) => Some(BuildQueued)
    Some(String("failed")) => Some(BuildFailed)
    Some(Null) | None => None
    Some(String(_)) => None
    _ => fail("invalid build_status field")
  }
}

///|
fn find_version_build_status(
  json : Json?,
  current_version : String,
) -> BuildStatus? raise Error {
  match json {
    Some(Array(versions)) => {
      for version_entry in versions {
        match version_entry {
          { "version": String(version), "build_status"? : build_status, .. } if version ==
            current_version => return decode_build_status(build_status)
          { "version": String(version), .. } if version == current_version =>
            return None
          _ => ()
        }
      }
      None
    }
    Some(Null) | None => None
    _ => fail("invalid versions field")
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
  }
}

///|
fn decode_module_meta(
  json : Json,
  current_version : String,
) -> Result[MetaInfo, String] {
  try {
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
        ..
      } => {
        let build_status = match
          find_version_build_status(versions, current_version) {
          Some(status) => Some(status)
          None =>
            match decode_build_status(metadata_build_status) {
              Some(status) => Some(status)
              None => decode_build_status(top_level_build_status)
            }
        }
        Ok(
          build_meta_info(
            name,
            version,
            decode_optional_string(repository),
            decode_optional_string(license),
            decode_optional_string(description),
            decode_keywords(keywords),
            decode_deps(deps),
            build_status,
          ),
        )
      }
      _ => Err("invalid module metadata")
    }
  } catch {
    err => Err(err.to_string())
  }
}

///|
fn decode_readme_content(json : Json) -> Result[String, String] {
  match json {
    { "readme_content": String(readme_content), .. } => Ok(readme_content)
    _ => Err("invalid resource.json")
  }
}
