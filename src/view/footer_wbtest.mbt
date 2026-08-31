///|
test "footer links use canonical site origins" {
  inspect(packages_href(), content="https://mooncakes.io/")
  inspect(build_queue_href(), content="https://mooncakes.io/build-queue")
  inspect(
    skills_href("skills.example.com"),
    content="https://skills.example.com/",
  )
}
