///| Todo： Optional option not displayed
pub(all) struct MetaInfoModel {
  author : String
  name : String
  readme : String?
  version : String
  license : String?
  keywords : Array[String]
  description : String?
  repository : String?
  module_path : String
  created_at : String?
} derive(Show)

///|
pub fn MetaInfoModel::empty() -> MetaInfoModel {
  {
    author: "",
    name: "",
    readme: None,
    version: "",
    license: None,
    keywords: [],
    description: None,
    repository: None,
    module_path: "",
    created_at: None,
  }
}
