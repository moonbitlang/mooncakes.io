///|
const GaMeasurementId = "G-H1TB82HJKT"

///|
let analytics_bootstrap : String =
  $|window.dataLayer = window.dataLayer || [];
  $|window.gtag = window.gtag || function () { window.dataLayer.push(arguments); };
  $|window.gtag('js', new Date());
  $|window.gtag('config', '\{GaMeasurementId}', { send_page_view: false });

///|
fn analytics_head() -> Array[Html] {
  [
    script(id="mooncakes-ga4-bootstrap", analytics_bootstrap),
    script(
      id="mooncakes-ga4-tag",
      src="https://www.googletagmanager.com/gtag/js?id=\{GaMeasurementId}",
      async_=true,
      nothing,
    ),
  ]
}

///|
#cfg(target="js")
extern "js" fn make_page_view_recorder(
  measurement_id : String,
) -> (String) -> Unit =
  #| (measurementId) => {
  #|   let previousLocation = '';
  #|   return (path) => {
  #|     if (typeof window.gtag !== 'function') return;
  #|     // Query edits and documentation anchors belong to the same page.
  #|     const pageLocation = window.location.origin + '/' + path.replace(/\/+$/, '');
  #|     if (pageLocation === previousLocation) return;
  #|     let pageReferrer = previousLocation;
  #|     if (!pageReferrer && document.referrer) {
  #|       try {
  #|         const referrer = new URL(document.referrer);
  #|         pageReferrer = referrer.origin + referrer.pathname;
  #|       } catch (_) {}
  #|     }
  #|     const context = {
  #|       page_location: pageLocation,
  #|       page_referrer: pageReferrer,
  #|       page_title: document.title,
  #|     };
  #|     window.gtag('set', context);
  #|     window.gtag('event', 'page_view', { ...context, send_to: measurementId });
  #|     previousLocation = pageLocation;
  #|   };
  #| }

///|
#cfg(target="js")
let record_page_view : (String) -> Unit = make_page_view_recorder(
  GaMeasurementId,
)

///|
#cfg(target="js")
#warnings("-alert_experimental")
extenum @cmd.Extension += {
  AnalyticsPageView(String)
}

///|
#cfg(target="js")
#warnings("-alert_experimental")
let analytics_page_view_op : @cmd.Op = @cmd.Op()..on_invoke((extension, _) => {
  guard extension is AnalyticsPageView(path) else {
    raise @cmd.Unhandled::Unhandled
  }
  AfterLayout(() => {
    record_page_view(path)
    none
  })
})

///|
#cfg(target="js")
#warnings("-alert_experimental")
fn analytics_page_view(url : @url.Url) -> Cmd {
  analytics_page_view_op.request(AnalyticsPageView(url.path))
}

///|
#cfg(not(target="js"))
fn analytics_page_view(_url : @url.Url) -> Cmd {
  none
}
