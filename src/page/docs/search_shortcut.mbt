///|
#cfg(target="js")
extern "js" fn watch_api_search_shortcut(on_search : () -> Unit) -> () -> Unit =
  #| (onSearch) => {
  #|   const handler = (event) => {
  #|     if (event.key !== '/' || event.defaultPrevented || event.isComposing ||
  #|         event.repeat || event.ctrlKey || event.metaKey || event.altKey) {
  #|       return;
  #|     }
  #|     const target = event.target instanceof Element
  #|       ? event.target : document.activeElement;
  #|     if (target && (target.isContentEditable ||
  #|         target.closest('input, textarea, select, [role="textbox"], [role="combobox"]'))) {
  #|       return;
  #|     }
  #|     // A tooltip can describe this shortcut without blocking it.
  #|     if (document.querySelector('dialog[open], [popover]:popover-open:not([role="tooltip"])')) {
  #|       return;
  #|     }
  #|     event.preventDefault();
  #|     onSearch();
  #|   };
  #|   document.addEventListener('keydown', handler);
  #|   return () => document.removeEventListener('keydown', handler);
  #| }

///|
#cfg(target="js")
priv suberror ApiSearchSubscription {
  Shortcut(Cmd)
}

///|
#cfg(target="js")
fn on_api_search_shortcut(command : Cmd) -> @sub.Sub {
  @sub.custom_sub(
    "api_search_shortcut",
    Local,
    ApiSearchSubscription::Shortcut(command),
    @sub.SubLoader((payload, scheduler) => {
      match payload {
        Shortcut(command) => {
          let mut command = command
          let unwatch = watch_api_search_shortcut(() => scheduler.add(command))
          Some({
            unload: _ => unwatch(),
            update_tagger: payload => {
              if payload is Shortcut(next) {
                command = next
              }
            },
          })
        }
        _ => None
      }
    }),
  )
}

///|
#cfg(not(target="js"))
fn on_api_search_shortcut(_command : Cmd) -> @sub.Sub {
  @sub.none
}
