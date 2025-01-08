# Trie

A trie, also known as a prefix tree, is a tree-like data structure that stores a collection of strings.
This implementation provides the basic functionality of a trie, including inserting strings and searching for strings.

# Usage

```moonbit
let trie = Trie::[("--search","search"), ("--switch","switch")]
trie.lookup("--search") |> print // Some("search")
let trie = trie.insert("-s", "s")
trie.lookup("-s") |> print // Some("s")
trie.lookup("--switch") |> print // Some("switch")
```

