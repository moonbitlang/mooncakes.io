# Documentation
|Type|description|
|---|---|
|[String](#String)||

## String


#### mooncakes-io-method-mark-Methods
- #### compare
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,79:::fn <a href="moonbitlang/core/string#String">String</a>::compare(self : String, other : String) -> Int
  ```
  > 
  >  Compare two strings.
  > String with longer length is bigger.
  > strings of the same length are compared in lexicalgraphic order.
- #### concat
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,51:::fn <a href="moonbitlang/core/string#String">String</a>::concat(strings : <a href="moonbitlang/core/array#Array">Array</a>[String], separator~ : String = ..) -> String
  ```
  > 
  >  Concatenate strings.
  >  
  >  ```
  >  let s = @string.concat(["Hello", ", ", "world!"])
  >  assert_eq!(s, "Hello, world!")
  >  let s = @string.concat(["a", "b", "c"], separator=",")
  >  assert_eq!(s, "a,b,c")
  >  ```
- #### contains
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,426:::fn <a href="moonbitlang/core/string#String">String</a>::contains(self : String, str : String) -> Bool
  ```
  > 
  >  Returns true if this string contains given sub string.
- #### contains\_char
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,259:::fn <a href="moonbitlang/core/string#String">String</a>::contains_char(self : String, c : Char) -> Bool
  ```
  > 
- #### default
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,97:::fn <a href="moonbitlang/core/string#String">String</a>::default() -> String
  ```
  > 
  >  The empty string
- #### ends\_with
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,442:::fn <a href="moonbitlang/core/string#String">String</a>::ends_with(self : String, str : String) -> Bool
  ```
  > 
  >  Returns true if this string ends with a sub string.
- #### fold
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,177:::fn <a href="moonbitlang/core/string#String">String</a>::fold[A](self : String, init~ : A, f : (A, Char) -> A) -> A
  ```
  > 
  >  Note: This method operates on Unicode characters, not Utf16 code units.
  > As a result, the count of characters passed to the folding function may not be equal to the length of the string.
- #### from\_array
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,26:::fn <a href="moonbitlang/core/string#String">String</a>::from_array(chars : <a href="moonbitlang/core/array#Array">Array</a>[Char]) -> String
  ```
  > 
  >  Convert char array to string.
  >  
  >  ```
  >  let s = @string.from_array(['H', 'e', 'l', 'l', 'o'])
  >  assert_eq!(s, "Hello")
  >  ```
  >  
  >  Do not convert large datas to `Array[Char]` and build a string with `String::from_array`.
  >  
  >  For efficiency considerations, it's recommended to use `Buffer` instead.
- #### from\_iter
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,37:::fn <a href="moonbitlang/core/string#String">String</a>::from_iter(iter : <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]) -> String
  ```
  > 
  >  Convert char iterator to string,
  > a simple wrapper for `from_array`.
- #### index\_of
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,329:::fn <a href="moonbitlang/core/string#String">String</a>::index_of(self : String, str : String, from~ : Int = ..) -> Int
  ```
  > 
  >  Returns the first index of the sub string.
- #### is\_blank
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,323:::fn <a href="moonbitlang/core/string#String">String</a>::is_blank(self : String) -> Bool
  ```
  > 
  >  Returns true if this string is blank.
- #### is\_empty
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,317:::fn <a href="moonbitlang/core/string#String">String</a>::is_empty(self : String) -> Bool
  ```
  > 
  >  Returns true if this string is empty.
- #### iter
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,129:::fn <a href="moonbitlang/core/string#String">String</a>::iter(self : String) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]
  ```
  > 
  >  Returns an iterator over the Unicode characters in the string.
  > 
  >  Note: This iterator yields Unicode characters, not Utf16 code units.
  > As a result, the count of characters returned by `iter().count()` may not be equal to the length of the string returned by `length()`.
  > 
  >  ```
  >  let s = "Hello, World!🤣";
  >  assert_eq!(s.iter().count(), 14); // Unicode characters
  >  assert_eq!(s.length(), 15); // Utf16 code units
  >  ```
- #### iter2
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,152:::fn <a href="moonbitlang/core/string#String">String</a>::iter2(self : String) -> <a href="moonbitlang/core/builtin#Iter2">Iter2</a>[Int, Char]
  ```
  > 
- #### last\_index\_of
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,373:::fn <a href="moonbitlang/core/string#String">String</a>::last_index_of(self : String, str : String, from~ : Int = ..) -> Int
  ```
  > 
  >  Returns the last index of the sub string.
- #### pad\_end
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,642:::fn <a href="moonbitlang/core/string#String">String</a>::pad_end(self : String, total_width : Int, padding_char : Char) -> String
  ```
  > 
  >  `pad_end` is a new String with `padding_char`s suffixed to `self` if `self.length() < total_width`. The length of the
  > returned string is `total_width`.
  >  
  >  Example:
  >  
  >  ```
  >  assert_eq!("2".pad_end(3, 'x'), "2xx")
  >  ```
- #### pad\_start
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,615:::fn <a href="moonbitlang/core/string#String">String</a>::pad_start(self : String, total_width : Int, padding_char : Char) -> String
  ```
  > 
  >  `pad_start` is a new string with `padding_char`s prefixed to `self` if `self.length() < total_width`. The length of the
  > returned string is `total_width`.
  >  
  >  Example:
  >  
  >  ```
  >  assert_eq!("2".pad_start(3, '0'), "002")
  >  ```
- #### repeat
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,591:::fn <a href="moonbitlang/core/string#String">String</a>::repeat(self : String, n : Int) -> String
  ```
  > 
  >  Repeats the string `n` times.
- #### replace
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,506:::fn <a href="moonbitlang/core/string#String">String</a>::replace(self : String, old~ : String, new~ : String) -> String
  ```
  > 
  >  Replace the first old string in this string to new string.
- #### replace\_all
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,519:::fn <a href="moonbitlang/core/string#String">String</a>::replace_all(self : String, old~ : String, new~ : String) -> String
  ```
  > 
  >  Replace all old string in this string to new string.
- #### rev
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,579:::fn <a href="moonbitlang/core/string#String">String</a>::rev(self : String) -> String
  ```
  > 
  >  Reverse string
- #### rev\_fold
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,186:::fn <a href="moonbitlang/core/string#String">String</a>::rev_fold[A](self : String, init~ : A, f : (A, Char) -> A) -> A
  ```
  > 
- #### rev\_iter
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,220:::fn <a href="moonbitlang/core/string#String">String</a>::rev_iter(self : String) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[Char]
  ```
  > 
  >  Returns an iterator that yields characters from the end to the start of the string. This function handles
  > Unicode surrogate pairs correctly, ensuring that characters are not split across surrogate pairs.
  >  
  >  #### Parameters
  >  
  >  - `self` : The input `String` to be iterated in reverse.
  >  
  >  #### Returns
  >  
  >  - An `Iter[Char]` that yields characters from the end to the start of the string.
  >  
  >  #### Behavior
  >  
  >  - The function iterates over the string in reverse order.
  >  - If a trailing surrogate is encountered, it checks for a preceding leading surrogate to form a complete Unicode code point.
  >  - Yields each character or combined code point to the iterator.
  >  - Stops iteration if the `yield_` function returns `IterEnd`.
  >  
  >  #### Examples
  >  
  >  ```
  >  let input = "Hello, World!"
  >  let reversed = input.rev_iter().collect()
  >  assert_eq!(reversed, ['!', 'd', 'l', 'r', 'o', 'W', ' ', ',', 'o', 'l', 'l', 'e', 'H'])
  >  ```
- #### split
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,478:::fn <a href="moonbitlang/core/string#String">String</a>::split(self : String, seperator : String) -> <a href="moonbitlang/core/builtin#Iter">Iter</a>[String]
  ```
  > 
  >  Splits the input `String` into an `Iter` of `String` using the specified `separator`.
  >  
  >  #### Parameters
  >  
  >  - `self` : The input `String` to be split.
  >  - `separator` : The `String` used as the delimiter for splitting.
  >  
  >  #### Returns
  >  
  >  - An `Iter` of `String` where each element is a substring of the original string, separated by the `separator`.
  >  
  >  #### Behavior
  >  
  >  - If the `separator` is an empty string (`""`), the function returns an `Iter` where each element is a single character from the input string converted to a `String`.
  >  - If the `separator` is not empty, the function searches for occurrences of the `separator` in the input string and yields substrings between these occurrences.
  >  - If no more occurrences of the `separator` are found, the remaining part of the string is yielded as the last element of the `Iter`.
  >  
  >  #### Examples
  >  
  >  ```
  >  let input = "a,b,c,d"
  >  let separator = ","
  >  let result = input.split(separator).collect()
  >  assert_eq!(result, ["a", "b", "c", "d"])
  >  ```
- #### starts\_with
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,432:::fn <a href="moonbitlang/core/string#String">String</a>::starts_with(self : String, str : String) -> Bool
  ```
  > 
  >  Returns true if this string starts with a sub string.
- #### to\_array
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,109:::fn <a href="moonbitlang/core/string#String">String</a>::to_array(self : String) -> <a href="moonbitlang/core/array#Array">Array</a>[Char]
  ```
  > 
  >  Converts the String into an array of Chars.
- #### to\_bytes
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,103:::fn <a href="moonbitlang/core/string#String">String</a>::to_bytes(self : String) -> Bytes
  ```
  > 
  >  `String` holds a sequence of UTF-16 code units encoded in little endian format
- #### to\_lower
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,549:::fn <a href="moonbitlang/core/string#String">String</a>::to_lower(self : String) -> String
  ```
  > 
  >  Converts this string to lowercase.
- #### to\_upper
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,564:::fn <a href="moonbitlang/core/string#String">String</a>::to_upper(self : String) -> String
  ```
  > 
  >  Converts this string to uppercase.
- #### trim
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,250:::fn <a href="moonbitlang/core/string#String">String</a>::trim(self : String, trim_set : String) -> String
  ```
  > 
  >  Removes all leading and trailing chars contained in the given string.
- #### trim\_end
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,291:::fn <a href="moonbitlang/core/string#String">String</a>::trim_end(self : String, trim_set : String) -> String
  ```
  > 
  >  Removes all trailing chars contained in the given string.
- #### trim\_left
  ```moonbit
  :::source,moonbitlang/core/string/deprecated.mbt,18:::fn <a href="moonbitlang/core/string#String">String</a>::trim_left(self : String, trim_set : String) -> String
  ```
  > 
  >  @alert deprecated "Use `String::trim_start` instead"
  > @coverage.skip
- #### trim\_right
  ```moonbit
  :::source,moonbitlang/core/string/deprecated.mbt,25:::fn <a href="moonbitlang/core/string#String">String</a>::trim_right(self : String, trim_set : String) -> String
  ```
  > 
  >  @alert deprecated "Use `String::trim_end` instead"
  > @coverage.skip
- #### trim\_space
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,244:::fn <a href="moonbitlang/core/string#String">String</a>::trim_space(self : String) -> String
  ```
  > 
  >  Removes all leading and trailing spaces.
- #### trim\_start
  ```moonbit
  :::source,moonbitlang/core/string/string.mbt,265:::fn <a href="moonbitlang/core/string#String">String</a>::trim_start(self : String, trim_set : String) -> String
  ```
  > 
  >  Removes all leading chars contained in the given string.
