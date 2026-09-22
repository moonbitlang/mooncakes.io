///|
pub extend ModuleHighlights with Eq::{equal, not_equal}

///|
pub extend LazyStatus with Eq::{equal, not_equal}

///|
pub extend CatalogModel with Eq::{equal, not_equal}

///|
pub extend PackageCount with Eq::{equal, not_equal}

///|
pub extend ModuleIndex with Eq::{equal, not_equal}

///|
pub extend ModuleIndex with @debug.Debug::{to_repr}

///|
pub extend SummaryFragment with Eq::{equal, not_equal}

///|
pub extend SummaryFragment with @debug.Debug::{to_repr}

///|
pub extend SummaryFragment with @json.FromJson::{from_json}

///|
pub extend PackageMatch with Eq::{equal, not_equal}

///|
pub extend PackageMatch with @debug.Debug::{to_repr}

///|
pub extend SearchResult with Eq::{equal, not_equal}

///|
pub extend SearchResult with @debug.Debug::{to_repr}

///|
pub extend SearchPhase with Eq::{equal, not_equal}

///|
pub extend SearchPhase with @debug.Debug::{to_repr}

///|
pub extend SearchModel with Eq::{equal, not_equal}

///|
pub extend SearchModel with @debug.Debug::{to_repr}

///|
pub extend SearchAction with Eq::{equal, not_equal}

///|
pub extend SearchAction with @debug.Debug::{to_repr}
