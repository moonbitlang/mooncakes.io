///|
pub(all) enum Lang {
  En
  Zh
} derive(Debug, Eq)

///|
pub fn[T] Lang::select(self : Lang, en~ : T, zh~ : T) -> T {
  match self {
    En => en
    Zh => zh
  }
}

///|
pub fn Lang::html_lang(self : Lang) -> String {
  match self {
    En => "en"
    Zh => "zh-CN"
  }
}
