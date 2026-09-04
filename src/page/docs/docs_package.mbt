///|
priv struct DocumentModel {
  collapsed_docs : FoldedState
  hide_large_package : Bool
} derive(Eq)

///|
priv enum DocumentMsg {
  ToggleDocDetail(String)
  DocModeChanged(CardMode)
  ShowLargePackage
  ClickAnchor(String)
}

///|
priv enum PackageAssets {
  Loading
  Ready(ResourceInfo, PackageData?)
  Failed
} derive(Eq)

///|
impl @rabbita.Enumerate for PackageAssets with fn tag(self) {
  match self {
    Loading => "loading"
    Ready(_, _) => "ready"
    Failed => "failed"
  }
}

///|
fn initial_folded_state(package_data : PackageData?) -> FoldedState {
  let folded = FoldedState::new()
  match package_data {
    None => folded
    Some({ types, traits, errors, misc, .. }) => {
      let types_impls = types.iter().flat_map(type_ => type_.impls.iter())
      let traits_impls = traits.iter().flat_map(trait_ => trait_.impls.iter())
      let errors_impls = errors.iter().flat_map(error => error.impls.iter())
      let misc_impls = misc.iter().flat_map(item => item.impls.iter())
      types_impls
      .concat(traits_impls)
      .concat(errors_impls)
      .concat(misc_impls)
      .map(ImplDoc::get_id)
      .fold(init=folded, FoldedState::add)
    }
  }
}

///|
fn docs_ready_package(
  manifest : Manifest,
  resolved : @util.MooncakePath,
  fragment : Val[String],
  resource : ResourceInfo,
  package_data : PackageData?,
) -> Val[(Html, Html)] {
  let (model, emit) = @rabbita.create_state_with_input(
    input=fragment,
    init=(_, fragment) => {
      (
        {
          collapsed_docs: initial_folded_state(package_data),
          hide_large_package: true,
        },
        @nav.scroll_to(fragment),
      )
    },
    update=(model, _fragment, msg, _emit) => {
      match msg {
        ToggleDocDetail(id) => {
          let folded_items = if model.collapsed_docs.contains(id) {
            model.collapsed_docs.remove(id)
          } else {
            model.collapsed_docs.add(id)
          }
          ({ ..model, collapsed_docs: folded_items, }, none)
        }
        DocModeChanged(card_mode) =>
          (
            {
              ..model,
              collapsed_docs: model.collapsed_docs.set_mode(card_mode),
            },
            none,
          )
        ShowLargePackage => ({ ..model, hide_large_package: false, }, none)
        ClickAnchor(id) =>
          (
            model,
            batch([
              @nav.push_url("#\{id}"),
              @nav.scroll_to(id, behavior=@nav.Smooth),
            ]),
          )
      }
    },
  )
  model.map(model => {
    let folded = model.collapsed_docs
    let module_name = manifest.module_
    let module_version = manifest.version
    let package_path = resolved.package_path()
    let readme = readme(
      Some(resource.readme_content),
      module_name~,
      module_version~,
      package_path~,
      folded~,
      toggle=emit(ToggleDocDetail("readme")),
    )
    let doc_list = match package_data {
      Some({ traits, types, errors, typealiases, values, misc, name: _, }) => {
        let count = traits.length() +
          types.length() +
          errors.length() +
          typealiases.length() +
          values.length() +
          misc.length()
        if model.hide_large_package && count > 1000 {
          [hidden_large_package(count, show=emit(ShowLargePackage))]
        } else {
          [
            ..typealiases.map(ta => {
              type_alias_doc(
                ta,
                folded~,
                module_name~,
                module_version~,
                toggle=id => emit(ToggleDocDetail(id)),
                anchor=id => emit(ClickAnchor(id)),
              )
            }),
            ..traits.map(tr => {
              trait_doc(
                tr,
                folded~,
                module_name~,
                module_version~,
                toggle=id => emit(ToggleDocDetail(id)),
                anchor=id => emit(ClickAnchor(id)),
              )
            }),
            ..errors.map(err => {
              type_doc(
                err,
                folded~,
                module_name~,
                module_version~,
                toggle=id => emit(ToggleDocDetail(id)),
                anchor=id => emit(ClickAnchor(id)),
              )
            }),
            ..types.map(ty => {
              type_doc(
                ty,
                folded~,
                module_name~,
                module_version~,
                toggle=id => emit(ToggleDocDetail(id)),
                anchor=id => emit(ClickAnchor(id)),
              )
            }),
            ..misc.map(item => {
              misc_doc(
                item,
                folded~,
                module_name~,
                module_version~,
                toggle=id => emit(ToggleDocDetail(id)),
                anchor=id => emit(ClickAnchor(id)),
              )
            }),
            ..values.map(value => {
              value_doc(
                value,
                folded~,
                module_name~,
                module_version~,
                enable_title=true,
                toggle=id => emit(ToggleDocDetail(id)),
                anchor=id => emit(ClickAnchor(id)),
              )
            }),
          ]
        }
      }
      _ => []
    }
    let content = div <| [
      div(class="animate-fade-in") <| [
        div(class="contents-center flex flex-col w-full") <| [
          readme,
          // Ensure left and right spacing on mobile devices
          div(class="mx-4 md:mx-0", doc_list),
        ],
      ],
      source_files_section(
        resource.source_files,
        package_path=make_versioned_asset_path(resolved),
      ),
    ]
    (
      content,
      card_mode_toggle(mode=model.collapsed_docs.card_mode, click=mode => {
        emit(DocModeChanged(mode))
      }),
    )
  })
}

///|
fn docs_package(
  manifest : Manifest,
  resolved : @util.MooncakePath,
  fragment : Val[String],
  build_notice~ : Val[Html?],
  module_index~ : @rabbita.Resource[ModuleIndex]?,
) -> Val[(Html, Html)] {
  let unavailable = build_notice.map(notice => {
    (
      if notice is Some(notice) {
        notice
      } else {
        @view.document_not_available(resolved.package_path())
      },
      card_mode_toggle(mode=Expanded, click=_ => none),
    )
  })
  guard module_index is Some(module_index) else { return unavailable }
  let asset_path = make_versioned_asset_path(resolved)
  let resource : @rabbita.Resource[ResourceInfo] = @rabbita.create_resource(inject => {
    @http.get(@config.asset_url("/assets/\{asset_path}/resource.json")).expect_json(
      inject,
    )
  })
  let package_data : Val[Status[PackageData]?] = module_index.switch(status => {
    let has_package = match status {
      Loaded(index) => index.has_package(resolved.package_path())
      Failed(_) =>
        manifest.name == resolved.package_path() && manifest.has_package
      Pending => false
    }
    if has_package {
      let data : @rabbita.Resource[PackageData] = @rabbita.create_resource(inject => {
        @http.get(@config.asset_url("/assets/\{asset_path}/package_data.json")).expect_json(
          inject,
        )
      })
      data.map(status => Some(status))
    } else {
      Val::constant(None)
    }
  })
  let assets : Val[PackageAssets] = resource.map3(package_data, module_index, fn(
    resource,
    package_data,
    module_index,
  ) {
    match (resource, package_data, module_index) {
      (Pending, _, _) | (_, Some(Pending), _) | (_, _, Pending) => Loading
      (Loaded(resource), None, _) => Ready(resource, None)
      (Loaded(resource), Some(Loaded(package_data)), _) =>
        Ready(resource, Some(package_data))
      _ => Failed
    }
  })
  assets.switch(assets => {
    match assets {
      Ready(resource, package_data) =>
        docs_ready_package(manifest, resolved, fragment, resource, package_data)
      Loading =>
        Val::constant(
          (
            @view.skeleton_docs_content(),
            card_mode_toggle(mode=Expanded, click=_ => none),
          ),
        )
      Failed => unavailable
    }
  })
}
