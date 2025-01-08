# Random

This is an efficient random number generation function based on the paper [Fast Random Integer Generation in an Interval](https://arxiv.org/abs/1805.10941) by Daniel Lemire, as well as the Golang's `rand/v2` package.

Internally, it uses the `Chacha8` cipher to generate random numbers. It is a cryptographically secure pseudo-random number generator (CSPRNG) that is also very fast.

# Usage

```moonbit
  let r = @random.new()
  assert_eq!(r.uint(limit=10), 7)
  assert_eq!(r.uint(limit=10), 0)
  assert_eq!(r.uint(limit=10), 5)
  assert_eq!(r.int(), 1064320769)
  assert_eq!(r.double(), 0.3318940049218405)
  assert_eq!(r.int(limit=10), 0)
  assert_eq!(r.uint(), 311122750)
  assert_eq!(r.int64(), -9223372036854775808)
  assert_eq!(r.int64(limit=10), 8)
  assert_eq!(r.uint64(), 3951155890335085418)
  let a = [1, 2, 3, 4, 5]
  r.shuffle(
    a.length(),
    fn(i : Int, j : Int) {
      let t = a[i]
      a[i] = a[j]
      a[j] = t
    },
  )
  assert_eq!(a, [2, 1, 4, 3, 5])
```

---
# Documentation
|Type|description|
|---|---|
|[Rand](#Rand)||

## Rand

```moonbit
:::source,moonbitlang/core/random/random.mbt,17:::type Rand
```

 Currently we only support \[chacha8\] as the source of randomness.

#### mooncakes-io-method-mark-Methods
- #### double
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,150:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::double(self : <a href="moonbitlang/core/random#Rand">Rand</a>) -> Double
  ```
  > 
  >  \[double\] returns a pseudo-random 64-bit Double in the range \[0.0, 1.0)
- #### float
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,163:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::float(self : <a href="moonbitlang/core/random#Rand">Rand</a>) -> Float
  ```
  > 
  >  \[float\] returns a pseudo-random 32-bit Float in the range \[0.0, 1.0)
- #### int
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,57:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::int(self : <a href="moonbitlang/core/random#Rand">Rand</a>, limit~ : Int = ..) -> Int
  ```
  > 
  >  \[int\] Return a non-negative pseudo-random 31-bit integer as an Int in the range \[0, 2^31) or \[0, limit) if limit is provided.
  >  
  >  #### Arguments
  >  
  >  * `limit` - The upper bound (exclusive) of the random number to be generated (Optional).
  >    When limit is 0, the range is \[0, 2^31).
- #### int64
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,73:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::int64(self : <a href="moonbitlang/core/random#Rand">Rand</a>, limit~ : Int64 = ..) -> Int64
  ```
  > 
  >  \[int64\] returns a non-negative pseudo-random 63-bit integer as an Int64 in the range \[0, 2^63)
  >  
  >  #### Arguments
  >  
  >  * `limit` - The upper bound (exclusive) of the random number to be generated (Optional).
  >    When limit is 0, the range is \[0, 2^63).
- #### new
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,24:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::new(seed~ : Bytes = ..) -> <a href="moonbitlang/core/random#Rand">Rand</a>
  ```
  > 
  >  Create a new random number generator with \[seed\].
  > @alert unsafe "Panic if seed is not 32 bytes long"
- #### shuffle
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,236:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::shuffle(self : <a href="moonbitlang/core/random#Rand">Rand</a>, limit : Int, swap : (Int, Int) -> Unit) -> Unit
  ```
  > 
  >  \[shuffle\] shuffles the first n elements of an array using the Fisher-Yates shuffle algorithm.
  > @alert unsafe "Panics if limit is negative"
  >  
  >  #### Example
  >  ```
  >  let r = @random.new()
  >  let a = [1, 2, 3, 4, 5]
  >  r.shuffle(
  >    a.length(),
  >    fn(i : Int, j : Int) {
  >      let t = a[i]
  >      a[i] = a[j]
  >      a[j] = t
  >    },
  >  )
  >  ```
- #### uint
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,91:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::uint(self : <a href="moonbitlang/core/random#Rand">Rand</a>, limit~ : UInt = ..) -> UInt
  ```
  > 
  >  \[uint\] returns a non-negative pseudo-random 32-bit integer as a Uint in the range \[0, 2^32) or \[0, limit) if limit is provided.
  >  
  >  #### Arguments
  >  
  >  * `limit` - The upper bound (exclusive) of the random number to be generated (Optional).
  >    When limit is 0, the range is \[0, 2^32).
- #### uint64
  ```moonbit
  :::source,moonbitlang/core/random/random.mbt,116:::fn <a href="moonbitlang/core/random#Rand">Rand</a>::uint64(self : <a href="moonbitlang/core/random#Rand">Rand</a>, limit~ : UInt64 = ..) -> UInt64
  ```
  > 
  >  \[uint64\] returns a non-negative pseudo-random 64-bit integer as a Uint64 in the range \[0, 2^64) or \[0, limit) if limit is provided.
  >  
  >  #### Arguments
  >  
  >  * `limit` - The upper bound (exclusive) of the random number to be generated (Optional).
  >    When limit is 0, the range is \[0, 2^64).
