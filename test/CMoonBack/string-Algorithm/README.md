# Algorithm of string library

This library contains string-related data structures and algorithms, including KMP, manachert algorithms, string hashes, suffix arrays, AC automata, etc.

At present, the KMP algorithm has been implemented, and the other algorithms are under development.

## Features

- **KMP**:Locate where the substring appears in the main string

## Usages

### KMP

```moonbit
let mainStr = "abcdeabcabab"
let subStr = "ab"
let ans : Array[Int] = kmp_index(mainStr, subStr)
```

## License

This project is licensed under the Apache-2.0 License.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Contact

For any questions or suggestions, please contact [2214559347@qq.com].
