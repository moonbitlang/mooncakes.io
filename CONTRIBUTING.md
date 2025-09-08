# Contributing

We welcome contributions from the community! To ensure a smooth collaboration, 
please follow these guidelines when contributing to the project. 

If you PR has been open too long without response, please feel free to ping the maintainers.

## General Naming Conventions

- **Function and Value Names**: `snake_case` is preferred.
- **Type Names**: `CamelCase` is preferred
- **Type parameters**: one character starting from `A` is preferred, e.g, `fn[A,B] Array::map(self : Array[A], f : (A) -> (B)) -> Array[B]`, for some established conventions, `Map[K,V]` it is also accepted.
- **Constants**: `UPPER_SNAKE_CASE` is preferred.

## Smaller, focused PRs/commits are preferred

Each PR or commit should address a single concern or feature. This approach makes 
reviews easier. If you are planning a large refactor, please contact the 
maintainers before submitting your changes.

## Handle all cases

Avoid partial match in pattern matching. If you need to encoding an invariant, 
use `guard` and `is` instead. 

## Keep code simple

Fast and efficient abstractions are preferred over *theoretically perfect* abstractions.


