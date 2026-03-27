///|
test "resolve basic module path" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi/mbt_rs"),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  inspect(p.map(MooncakePath::module_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::package_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::version), content="Some(\"1.0.0\")")
}

///|
test "resolve versioned module path" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi/mbt_rs@0.3.0"),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  inspect(p.map(MooncakePath::module_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::package_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::version), content="Some(\"0.3.0\")")
}

///|
test "resolve versioned with package path" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi/mbt_rs@0.3.0/lib/sub"),
    module_path="mizchi/mbt_rs",
    latest_version="0.5.0",
  )
  inspect(p.map(MooncakePath::module_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"mizchi/mbt_rs/lib/sub\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"0.3.0\")")
}

///|
test "resolve unversioned with package path" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("moonbitlang/core/builtin"),
    module_path="moonbitlang/core",
    latest_version="0.5.0",
  )
  inspect(
    p.map(MooncakePath::module_path),
    content="Some(\"moonbitlang/core\")",
  )
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"moonbitlang/core/builtin\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"0.5.0\")")
}

///|
test "resolve mismatch returns Err" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi/mbt_rs@0.3.0"),
    module_path="tonyfettes/tree_sitter",
    latest_version="1.0.0",
  )
  assert_true(p is None)
}

///|
test "resolve path shorter than module returns Err" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi"),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  assert_true(p is None)
}

///|
test "resolve @latest uses latest_version" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi/mbt_rs@latest/lib"),
    module_path="mizchi/mbt_rs",
    latest_version="2.0.0",
  )
  inspect(p.map(MooncakePath::module_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"mizchi/mbt_rs/lib\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"2.0.0\")")
}

///|
test "resolve trailing slash" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi/mbt_rs/"),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  inspect(p.map(MooncakePath::module_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::package_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::version), content="Some(\"1.0.0\")")
}

///|
test "resolve leading slash" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("/mizchi/mbt_rs"),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  inspect(p.map(MooncakePath::module_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::package_path), content="Some(\"mizchi/mbt_rs\")")
  inspect(p.map(MooncakePath::version), content="Some(\"1.0.0\")")
}

///|
test "resolve double slash returns Err" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("mizchi//mbt_rs"),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  assert_true(p is None)
}

///|
test "resolve empty path returns Err" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath(""),
    module_path="mizchi/mbt_rs",
    latest_version="1.0.0",
  )
  assert_true(p is None)
}

///|
test "resolve three-segment module" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("org/team/project"),
    module_path="org/team/project",
    latest_version="1.0.0",
  )
  inspect(
    p.map(MooncakePath::module_path),
    content="Some(\"org/team/project\")",
  )
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"org/team/project\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"1.0.0\")")
}

///|
test "resolve three-segment module with version" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("org/team/project@2.0.0/sub/pkg"),
    module_path="org/team/project",
    latest_version="1.0.0",
  )
  inspect(
    p.map(MooncakePath::module_path),
    content="Some(\"org/team/project\")",
  )
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"org/team/project/sub/pkg\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"2.0.0\")")
}

///|
test "resolve four-segment module" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("org/team/project/sub"),
    module_path="org/team/project/sub",
    latest_version="1.0.0",
  )
  inspect(
    p.map(MooncakePath::module_path),
    content="Some(\"org/team/project/sub\")",
  )
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"org/team/project/sub\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"1.0.0\")")
}

///|
test "resolve four-segment module with version and package" {
  let p = MooncakePath::resolve(
    UnsolvedMooncakePath("org/team/project/sub@3.0.0/lib/core"),
    module_path="org/team/project/sub",
    latest_version="1.0.0",
  )
  inspect(
    p.map(MooncakePath::module_path),
    content="Some(\"org/team/project/sub\")",
  )
  inspect(
    p.map(MooncakePath::package_path),
    content="Some(\"org/team/project/sub/lib/core\")",
  )
  inspect(p.map(MooncakePath::version), content="Some(\"3.0.0\")")
}

///|
test "is_same_module basic" {
  let p : MooncakePath = {
    module_path: "mizchi/mbt_rs",
    package_path: "mizchi/mbt_rs",
    version: "0.5.0",
    latest_version: "0.5.0",
  }
  assert_true(
    p.is_same_module(UnsolvedMooncakePath("mizchi/mbt_rs"), check_version=false),
  )
  assert_true(
    p.is_same_module(
      UnsolvedMooncakePath("mizchi/mbt_rs@0.5.0"),
      check_version=false,
    ),
  )
  assert_true(
    p.is_same_module(
      UnsolvedMooncakePath("mizchi/mbt_rs@0.4.0"),
      check_version=false,
    ),
  )
  assert_true(
    p.is_same_module(
      UnsolvedMooncakePath("mizchi/mbt_rs/lib"),
      check_version=false,
    ),
  )
  assert_false(
    p.is_same_module(UnsolvedMooncakePath("other/pkg"), check_version=false),
  )
}

///|
test "is_same_module check_version" {
  let p : MooncakePath = {
    module_path: "mizchi/mbt_rs",
    package_path: "mizchi/mbt_rs",
    version: "0.5.0",
    latest_version: "0.5.0",
  }
  assert_true(p.is_same_module(UnsolvedMooncakePath("mizchi/mbt_rs@0.5.0")))
  assert_false(p.is_same_module(UnsolvedMooncakePath("mizchi/mbt_rs@1.0.0")))
  assert_true(p.is_same_module(UnsolvedMooncakePath("mizchi/mbt_rs@latest")))
  assert_true(p.is_same_module(UnsolvedMooncakePath("mizchi/mbt_rs")))
}

///|
test "is_same_package basic" {
  let p : MooncakePath = {
    module_path: "mizchi/mbt_rs",
    package_path: "mizchi/mbt_rs/lib",
    version: "0.5.0",
    latest_version: "0.5.0",
  }
  assert_true(
    p.is_same_package(
      UnsolvedMooncakePath("mizchi/mbt_rs/lib"),
      check_version=false,
    ),
  )
  assert_true(
    p.is_same_package(
      UnsolvedMooncakePath("mizchi/mbt_rs@0.5.0/lib"),
      check_version=false,
    ),
  )
  assert_false(
    p.is_same_package(
      UnsolvedMooncakePath("mizchi/mbt_rs/other"),
      check_version=false,
    ),
  )
  assert_false(
    p.is_same_package(
      UnsolvedMooncakePath("mizchi/mbt_rs"),
      check_version=false,
    ),
  )
}

///|
test "is_same_package check_version" {
  let p : MooncakePath = {
    module_path: "mizchi/mbt_rs",
    package_path: "mizchi/mbt_rs/lib",
    version: "0.5.0",
    latest_version: "0.5.0",
  }
  assert_true(
    p.is_same_package(UnsolvedMooncakePath("mizchi/mbt_rs@0.5.0/lib")),
  )
  assert_false(
    p.is_same_package(UnsolvedMooncakePath("mizchi/mbt_rs@1.0.0/lib")),
  )
  assert_true(
    p.is_same_package(UnsolvedMooncakePath("mizchi/mbt_rs@latest/lib")),
  )
  assert_true(p.is_same_package(UnsolvedMooncakePath("mizchi/mbt_rs/lib")))
}

///|
test "is_same_module invalid input" {
  let p : MooncakePath = {
    module_path: "mizchi/mbt_rs",
    package_path: "mizchi/mbt_rs",
    version: "0.5.0",
    latest_version: "0.5.0",
  }
  assert_false(p.is_same_module(UnsolvedMooncakePath("")))
  assert_false(p.is_same_module(UnsolvedMooncakePath("/")))
  assert_false(p.is_same_module(UnsolvedMooncakePath("mizchi//mbt_rs")))
  assert_false(p.is_same_module(UnsolvedMooncakePath("mizchi")))
}

///|
test "is_same_package invalid input" {
  let p : MooncakePath = {
    module_path: "mizchi/mbt_rs",
    package_path: "mizchi/mbt_rs/lib",
    version: "0.5.0",
    latest_version: "0.5.0",
  }
  assert_false(p.is_same_package(UnsolvedMooncakePath("")))
  assert_false(p.is_same_package(UnsolvedMooncakePath("/")))
  assert_false(p.is_same_package(UnsolvedMooncakePath("mizchi//mbt_rs/lib")))
  assert_false(p.is_same_package(UnsolvedMooncakePath("mizchi")))
}

///|
test "unsolved package_path strips version" {
  inspect(
    UnsolvedMooncakePath("trkbt10/osenv@latest/dirs").package_path(),
    content="trkbt10/osenv/dirs",
  )
  inspect(
    UnsolvedMooncakePath("mizchi/mbt_rs@0.3.0/lib").package_path(),
    content="mizchi/mbt_rs/lib",
  )
  inspect(
    UnsolvedMooncakePath("moonbitlang/core/builtin").package_path(),
    content="moonbitlang/core/builtin",
  )
  inspect(
    UnsolvedMooncakePath("mizchi/mbt_rs").package_path(),
    content="mizchi/mbt_rs",
  )
}
