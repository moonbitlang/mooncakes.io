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
priv enum CardMode {
  Expanded
  Collapsed
} derive(Eq)

///|
fn card_mode_toggle(
  mode~ : CardMode,
  click~ : (CardMode) -> Cmd,
  disabled~ : Bool = false,
) -> Val[Html] {
  let (next_mode, label, icon) = match mode {
    Expanded =>
      (
        Collapsed,
        "Collapse all documentation",
        @config.asset_url("/icons/lucide/list-chevrons-down-up.svg"),
      )
    Collapsed =>
      (
        Expanded,
        "Expand all documentation",
        @config.asset_url("/icons/lucide/list-chevrons-up-down.svg"),
      )
  }
  @rui.tooltip(
    id="docs-card-mode-tooltip",
    trigger_variant=Ghost,
    trigger_size=Icon,
    trigger_attrs=@html.Attrs::build().aria_label(label),
    disabled~,
    delay=250,
    side=Bottom,
    align=End,
    side_offset=8,
    on_trigger_click=click(next_mode),
    img(class="ui-icon h-4 w-4", src=icon, alt=""),
    label,
  )
}
