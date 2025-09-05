// Copyright 2025 International Digital Economy Academy
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
struct Model {
  history : Array[StatisticsDetail]
  loading : Bool
  expanded : Set[String]
}

///|
priv struct StatisticsDetail {
  time : String
  total_lines : Int
  package_count : Int
  added_lines : Int
  added_packages : Array[String]
  deleted_pacakges : Array[String]
  previous : String?
}

///|
fn decode_statistics_detail(json : Json) -> Result[StatisticsDetail, String] {
  match json {
    {
      "time": String(time),
      "totalLines": Number(total_lines, ..),
      "packagesCount": Number(total_packages, ..),
      "addedLines": Number(line_changes, ..),
      "addedPackages": Array(added),
      "deletedPackages": Array(deleted),
      "previousStatistics"? : previous,
      ..
    } => {
      let added_packages = added.filter_map(x => x.as_string())
      let deleted_pacakges = deleted.filter_map(x => x.as_string())
      let previous = match previous {
        Some(String(x)) => Some(x)
        _ => None
      }
      Ok({
        time,
        total_lines: total_lines.to_int(),
        package_count: total_packages.to_int(),
        added_packages,
        deleted_pacakges,
        added_lines: line_changes.to_int(),
        previous,
      })
    }
    _ => Err("failed to decode json: \{json}")
  }
}

///|
enum Msg {
  GotStatisticsDetail(Result[StatisticsDetail, String])
  ToggleCollapsed(String)
}

///|
pub fn load() -> (Cmd[Msg], Model) {
  (
    @http.get(
      "/assets/stat-latest.json",
      expect=Json(GotStatisticsDetail(_), decode_statistics_detail),
    ),
    { history: [], loading: true, expanded: Set::new() },
  )
}

///|
fnalias @html.(div, h1, h2, p, text, ul, li, hr, nothing)

///|
fnalias @cmd.none

///|
typealias @cmd.Cmd

///|
fn item(stat : StatisticsDetail, expanded : Set[String]) -> Html[Msg] {
  let line_changes = if stat.added_lines > 0 {
    "+\{stat.added_lines}"
  } else {
    "-\{stat.added_lines}"
  }
  let added_key = stat.time + "-added-pkg"
  let removed_key = stat.time + "-removed-pkg"
  div(class="border-t px-4", [
    h2(class="text-2xl my-4", [text(stat.time)]),
    p([text("Total lines of code: \{stat.total_lines}")]),
    p([text("Line changes: \{line_changes}")]),
    p([text("Total packages: \{stat.package_count}")]),
    @view.collapse(
      header=p(class="pl-8 py-1",[text("Added packages (\{stat.added_packages.length()})")]),
      body=ul(
        class="pl-8",
        stat.added_packages.map(x => li(class="list-disc", [text(x)])),
      ),
      collapsed=!expanded.contains(added_key),
      toggle=ToggleCollapsed(added_key),
      caret_config=@view.CaretConfig::LeftCenter,
    ),
    @view.collapse(
      header=p(class="pl-8 py-1",[text("Deleted packages (\{stat.deleted_pacakges.length()})")]),
      body=ul(
        class="pl-8",
        stat.deleted_pacakges.map(x => li(class="list-disc", [text(x)])),
      ),
      caret_config=@view.CaretConfig::LeftCenter,
      toggle=ToggleCollapsed(removed_key),
      collapsed=!expanded.contains(removed_key),
    ),
  ])
}

///|
pub fn view(model : Model) -> Html[Msg] {
  let items = model.history.map(x => item(x, model.expanded))
  let loading = if model.loading {
    div(class="py-10 border-t my-10 flex justify-center", [text("Loading...")])
  } else {
    nothing()
  }
  div(class="min-h-screen w-full flex-col", [
    div(class="flex-1", [
      div(class="container lg:px-4 h-full w-full", [
        h1(class="text-4xl py-4 my-4 font-semibold", [
          text("Statistics of mooncakes.io"),
        ]),
        div(items),
        loading,
        div(class="h-50", []),
      ]),
    ]),
  ])
}

///|
pub fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    ToggleCollapsed(key) => {
      if model.expanded.contains(key) {
        model.expanded.remove(key)
      } else {
        model.expanded.add(key)
      }
      (none(), model)
    }
    GotStatisticsDetail(result) =>
      match result {
        Ok(stat) => {
          model.history.push(stat)
          match stat.previous {
            None => (none(), { ..model, loading: false })
            Some(n) => {
              println(n)
              let cmd = @http.get(
                "/assets/\{n}",
                expect=Json(GotStatisticsDetail(_), decode_statistics_detail),
              )
              (cmd, model)
            }
          }
        }
        Err(msg) => {
          println(msg)
          (none(), model)
        }
      }
  }
}
