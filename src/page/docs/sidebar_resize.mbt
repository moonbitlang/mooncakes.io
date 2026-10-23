///|
fn sidebar_resize_attrs() -> @html.Attrs {
  let attrs = @html.Attrs::build()
    .role("separator")
    .tabindex(0)
    .aria_label("Resize navigation sidebar")
    .aria_orientation("vertical")
  bind_sidebar_resize(attrs)
}

///|
#cfg(target="js")
fn bind_sidebar_resize(attrs : @html.Attrs) -> @html.Attrs {
  attrs
  .on_pointerdown(event => {
    resize_sidebar(event)
    none
  })
  .on_keydown(event => {
    resize_sidebar_key(event)
    none
  })
}

///|
#cfg(not(target="js"))
fn bind_sidebar_resize(attrs : @html.Attrs) -> @html.Attrs {
  attrs
}

///|
#cfg(target="js")
extern "js" fn resize_sidebar(event : @dom.MouseEvent) -> Unit =
  #| (event) => {
  #|   if (event.button !== 0) return;
  #|   const handle = event.currentTarget;
  #|   const panel = handle.closest('.docs-sidebar-panel');
  #|   const startWidth = panel.getBoundingClientRect().width;
  #|   const startX = event.clientX;
  #|   const pointerId = event.pointerId;
  #|   event.preventDefault();
  #|   handle.setPointerCapture(pointerId);
  #|   handle.dataset.resizing = 'true';
  #|   const move = (next) => {
  #|     if (next.pointerId !== pointerId) return;
  #|     const max = Math.max(224, Math.min(640, window.innerWidth * 0.4));
  #|     const width = Math.round(Math.max(224, Math.min(max, startWidth + next.clientX - startX)));
  #|     document.documentElement.style.setProperty('--docs-nav-width', width + 'px');
  #|     handle.setAttribute('aria-valuenow', String(width));
  #|   };
  #|   const finish = (next) => {
  #|     if (next.pointerId !== pointerId) return;
  #|     delete handle.dataset.resizing;
  #|     handle.removeEventListener('pointermove', move);
  #|     handle.removeEventListener('pointerup', finish);
  #|     handle.removeEventListener('pointercancel', finish);
  #|     handle.removeEventListener('lostpointercapture', finish);
  #|     if (handle.hasPointerCapture(pointerId)) handle.releasePointerCapture(pointerId);
  #|   };
  #|   handle.addEventListener('pointermove', move);
  #|   handle.addEventListener('pointerup', finish);
  #|   handle.addEventListener('pointercancel', finish);
  #|   handle.addEventListener('lostpointercapture', finish);
  #| }

///|
#cfg(target="js")
extern "js" fn resize_sidebar_key(event : @dom.KeyboardEvent) -> Unit =
  #| (event) => {
  #|   if (!['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) return;
  #|   event.preventDefault();
  #|   const handle = event.currentTarget;
  #|   const current = handle.closest('.docs-sidebar-panel').getBoundingClientRect().width;
  #|   const max = Math.max(224, Math.min(640, window.innerWidth * 0.4));
  #|   const requested = event.key === 'Home' ? 224 : event.key === 'End' ? max : current + (event.key === 'ArrowRight' ? 16 : -16);
  #|   const width = Math.round(Math.max(224, Math.min(max, requested)));
  #|   document.documentElement.style.setProperty('--docs-nav-width', width + 'px');
  #|   handle.setAttribute('aria-valuenow', String(width));
  #| }
