///|
priv struct ModuleVersion {
  version : String
  yanked : String?
} derive(Eq)

///|
fn decode_module_versions(
  json : Json?,
  current_version : String,
  current_yanked : String?,
  path : @json.JsonPath,
) -> Array[ModuleVersion] raise @json.JsonDecodeError {
  let versions : Array[ModuleVersion] = []
  match json {
    Some(Array(entries)) =>
      for entry in entries {
        if entry is { "version": String(version), .. } &&
          !version.is_empty() &&
          !versions.any(item => item.version == version) {
          versions.push({ version, yanked: @util.decode_yanked(entry), })
        }
      }
    Some(Null) | None => ()
    _ => raise JsonDecodeError((path, "invalid versions field"))
  }
  // Older manifests can omit the list or the version being viewed.
  if versions.any(item => item.version == current_version) {
    versions
  } else {
    [{ version: current_version, yanked: current_yanked, }, ..versions]
  }
}

///|
fn module_version_select(
  manifest : Manifest,
  resolved : Val[@util.MooncakePath?],
) -> Val[Html] {
  let options = manifest.versions.map(item => {
    let latest = if item.version == manifest.latest_version {
      " (latest)"
    } else {
      ""
    }
    let deprecated = if item.yanked is Some(_) { " (deprecated)" } else { "" }
    @rui.select_option(
      value=item.version,
      label="\{item.version}\{latest}\{deprecated}",
    )
  })
  let package_path = resolved.map(path => {
    match path {
      Some(path) => path.package_path()
      None => manifest.name
    }
  })
  package_path.switch_by(by=path => path, package_path => {
    @rui.select(
      id="docs-version",
      options~,
      default_value=manifest.version,
      disabled=manifest.module_ == "moonbitlang/core",
      on_value_change=version => {
        if version == manifest.version {
          none
        } else {
          let path = versioned_docs_path(
            package_path,
            manifest.module_,
            version,
          )
          @nav.push_url("/docs/\{path}")
        }
      },
      class="docs-version-select",
    )
  })
}
