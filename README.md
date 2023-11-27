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

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/colinnielsen/noir-array-helpers/blob/main/LICENSE) file for details.
