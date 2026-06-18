///|
test "footer links on skills host" {
  inspect(packages_href("skills.mooncakes.io"), content="https://mooncakes.io/")
  inspect(
    build_queue_href("skills.mooncakes.io"),
    content="https://mooncakes.io/build-queue",
  )
  inspect(skills_href("skills.mooncakes.io"), content="/")
}

///|
test "footer links on production host" {
  inspect(packages_href("mooncakes.io"), content="/")
  inspect(build_queue_href("mooncakes.io"), content="/build-queue")
  inspect(skills_href("mooncakes.io"), content="https://skills.mooncakes.io/")
}

///|
test "footer links on local host" {
  inspect(packages_href("localhost:5173"), content="/")
  inspect(build_queue_href("localhost:5173"), content="/build-queue")
  inspect(skills_href("localhost:5173"), content="/skills")
}
