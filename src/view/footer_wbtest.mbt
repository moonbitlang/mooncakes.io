///|
test "footer links use canonical site origins" {
  inspect(packages_href(), content="https://mooncakes.io/")
  inspect(build_queue_href(), content="https://mooncakes.io/build-queue")
  inspect(skills_href(), content="https://skills.mooncakes.io/")
  inspect(icp_filing_href(), content="https://beian.miit.gov.cn/")
  inspect(
    public_security_filing_href(),
    content="https://beian.mps.gov.cn/#/query/webSearch?code=44030002004653",
  )
}
