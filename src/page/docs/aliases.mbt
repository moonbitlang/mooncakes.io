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
fnalias @html.(
  div,
  text,
  h1,
  p,
  pre,
  code,
  span,
  nothing,
  a,
  h3,
  ul,
  img,
  button
)

///|
fnalias @tea.(batch, none)

///|
typealias @html.Html

///|
typealias @tea.Cmd

///|
typealias @util.Status

///|
typealias @immut/sorted_set.SortedSet as Set

///|
typealias @immut/sorted_map.SortedMap as Map

///|
typealias @lazy.Lazy
