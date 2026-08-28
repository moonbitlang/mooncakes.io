///|
test "lang selects localized values and HTML language" {
  inspect(@i18n.En.select(en="English", zh="中文"), content="English")
  inspect(@i18n.Zh.select(en="English", zh="中文"), content="中文")
  inspect(@i18n.En.select(en=1, zh=2), content="1")
  inspect(@i18n.Zh.select(en=1, zh=2), content="2")
  inspect(@i18n.En.html_lang(), content="en")
  inspect(@i18n.Zh.html_lang(), content="zh-CN")
}
