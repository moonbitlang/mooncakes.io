///|
test "stale search responses and timers cannot replace the current query" {
  let model : SkillsSearchModel = {
    query: "writing",
    request_id: 2,
    offset: 0,
    phase: Loading,
    page: { items: [], total: 0, limit: 24, offset: 0, },
    copied: "",
  }
  let emit : @rabbita.Emit[SkillsMsg] = _ => none
  let stale_page : SkillsSearchPage = {
    items: [],
    total: 99,
    limit: 24,
    offset: 0,
  }
  assert_true(
    update_skills(model, Completed(1, Ok(stale_page)), emit).0 == model,
  )
  assert_true(update_skills(model, TimedOut(1), emit).0 == model)
  let loaded = update_skills(model, Completed(2, Ok(stale_page)), emit).0
  assert_true(loaded.phase == Ready)
  assert_eq(loaded.page.total, 99)
  assert_true(update_skills(loaded, TimedOut(2), emit).0 == loaded)
}

///|
test "new query resets pagination and invalidates an in-flight request" {
  let model : SkillsSearchModel = {
    query: "old",
    request_id: 7,
    offset: 24,
    phase: Loading,
    page: { items: [], total: 30, limit: 24, offset: 24, },
    copied: "",
  }
  let emit : @rabbita.Emit[SkillsMsg] = _ => none
  let next = update_skills(model, Changed("new"), emit).0
  assert_eq(next.query, "new")
  assert_eq(next.offset, 0)
  assert_true(next.phase == Waiting)
  assert_true(update_skills(next, Completed(7, Ok(model.page)), emit).0 == next)
}
