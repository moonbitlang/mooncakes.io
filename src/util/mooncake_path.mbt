///|
struct UnsolvedMooncakePath(String)

///|
pub fn UnsolvedMooncakePath::to_string(s : Self) -> String {
  s.0
}

///|
struct MooncakePath {
  module_path : String
  package_path : String
  version : String
  latest_version : String
}

///|
pub fn MooncakePath::is_same_module(
  self : Self,
  other : UnsolvedMooncakePath,
  check_version~ : Bool = true,
) -> Bool {
  match MooncakePath::resolve(other, module_path=self.module_path, latest_version=self.latest_version) {
    None => false
    Some(resolved) =>
      not(check_version) || self.version == resolved.version
  }
}

///|
pub fn MooncakePath::is_same_package(
  self : Self,
  other : UnsolvedMooncakePath,
  check_version~ : Bool = true,
) -> Bool {
  match MooncakePath::resolve(other, module_path=self.module_path, latest_version=self.latest_version) {
    None => false
    Some(resolved) =>
      self.package_path == resolved.package_path &&
        (not(check_version) || self.version == resolved.version)
  }
}

///|
pub fn MooncakePath::resolve(
  path : UnsolvedMooncakePath,
  module_path~ : String,
  latest_version~ : String,
) -> Self? {
  let module_path = module_path.trim(chars="/").to_string()
  let path = path.0.trim(chars="/")
  let path_segs : Array[String] = path
    .split("/")
    .map(StringView::to_string)
    .collect()
  let mod_segs : Array[String] = module_path
    .split("/")
    .map(StringView::to_string)
    .collect()
  if path_segs.length() < mod_segs.length() {
    return None
  }
  let mut version : String? = None
  for i, mod_seg in mod_segs {
    let path_seg = path_segs[i]
    let parts : Array[String] = path_seg
      .split("@")
      .map(StringView::to_string)
      .collect()
    match parts {
      [name, ver] => {
        if name != mod_seg {
          return None
        }
        version = Some(ver)
      }
      [name] => if name != mod_seg { return None }
      _ => return None
    }
  }
  let version = match version {
    None | Some("latest") => latest_version
    Some(v) => v
  }
  let package_parts : Array[String] = [..mod_segs]
  for i in mod_segs.length()..<path_segs.length() {
    package_parts.push(path_segs[i])
  }
  Some({ module_path, package_path: package_parts.join("/"), version, latest_version })
}

///|
pub fn MooncakePath::module_path(s : Self) -> String {
  s.module_path
}

///|
pub fn MooncakePath::package_path(s : Self) -> String {
  s.package_path
}

///|
pub fn MooncakePath::version(s : Self) -> String {
  s.version
}

///|
pub fn MooncakePath::latest_version(s : Self) -> String {
  s.latest_version
}

