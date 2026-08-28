///|
test "site switch targets fixed site roots" {
  inspect(site_switch_href(@i18n.En), content="https://pkg.moonbitlang.cn/")
  inspect(site_switch_href(@i18n.Zh), content="https://mooncakes.io/")
}
