# Noir base64

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Nargo Test 🌌](https://github.com/zkworks-xyz/noir-base64/actions/workflows/test.yaml/badge.svg)](https://github.com/zkworks-xyz/noir-base64/actions/workflows/test.yaml)

**Noir base64** contains functions for base64 string and `u8` array encoding for Aztec's **Noir** language

## Installation

In your `Nargo.toml` file, add the following dependency:

```toml
[dependencies]
base64 = { tag = "v0.1.0", git = "https://github.com/zkworks-xyz/noir-base64" }
```

## Usage

```rust
use dep::base64;

fn main() {
    let result: [u8; 8] = base64::encode_str("foobar", [0; 8]);
}
```

## API
Library exposes two functions:

```rust
pub fn encode_str<N, M>(input: str<N>, mut result: [u8; M]) -> [u8; M]
pub fn encode<N, M>(input: [u8; N], mut result: [u8; M], url_safe: bool) -> [u8; M]
```

- `input` - input string or array of bytes to encode
- `result` - array of bytes to store result in. it should have a proper size otherwise function will fail on assert. 
    Due to Noir language limitations result size need to be known at compile time and should be calculated by user.
    Value of this parameter is irrelevant, only size matters.
- `url_safe` - if `true` then `+` and `/` characters will be replaced with `-` and `_` respectively ([RFC4648](https://datatracker.ietf.org/doc/html/rfc4648#section-5))
- Returns `result` array with encoded string. Function result is the same as `result` argument.

## Example project
Directory `examples/base64_example/` contains example Noir project with `base64` library as dependency.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/colinnielsen/noir-array-helpers/blob/main/LICENSE) file for details.
