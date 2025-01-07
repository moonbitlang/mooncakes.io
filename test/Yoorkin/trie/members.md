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


---
# Documentation
|Type|description|
|---|---|
|[T](#T)||

|Value|description|
|---|---|
|[empty](#empty)||

## T

```moonbit
:::source,Yoorkin/trie/trie.mbt,1:::type T
```


#### mooncakes-io-method-mark-Methods
- #### add
  ```moonbit
  :::source,Yoorkin/trie/trie.mbt,22:::fn <a href="Yoorkin/trie#T">T</a>::add[A](self : <a href="Yoorkin/trie#T">T</a>[A], path : String, value : A) -> <a href="Yoorkin/trie#T">T</a>[A]
  ```
  > 
- #### from\_array
  ```moonbit
  :::source,Yoorkin/trie/trie.mbt,52:::fn <a href="Yoorkin/trie#T">T</a>::from_array[A](data : <a href="moonbitlang/core/array#Array">Array</a>[(String, A)]) -> <a href="Yoorkin/trie#T">T</a>[A]
  ```
  > 
- #### insert
  ```moonbit
  :::source,Yoorkin/trie/trie.mbt,18:::fn <a href="Yoorkin/trie#T">T</a>::insert[A](self : <a href="Yoorkin/trie#T">T</a>[A], path : String, value : A) -> <a href="Yoorkin/trie#T">T</a>[A]
  ```
  >  @alert deprecated "use `add` instead"
- #### lookup
  ```moonbit
  :::source,Yoorkin/trie/trie.mbt,6:::fn <a href="Yoorkin/trie#T">T</a>::lookup[A](self : <a href="Yoorkin/trie#T">T</a>[A], path : String) -> A?
  ```
  > 
- #### of
  ```moonbit
  :::source,Yoorkin/trie/trie.mbt,40:::fn <a href="Yoorkin/trie#T">T</a>::of[A](data : <a href="moonbitlang/core/array#FixedArray">FixedArray</a>[(String, A)]) -> <a href="Yoorkin/trie#T">T</a>[A]
  ```
  > 

## empty

```moonbit
:::source,Yoorkin/trie/trie.mbt,36:::fn empty[a]() -> <a href="Yoorkin/trie#T">T</a>[a]
```

