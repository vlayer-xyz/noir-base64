mod utils;

use dep::std;
use crate::utils::{as_byte, as_bytes};

global MAX_INPUT_LEN = 600;
global MAX_RESULT_LEN = 800;

pub fn encode_str<N, M>(input: str<N>, mut result: [u8; M]) -> [u8; M] {
    encode(as_bytes(input), result, false)
}

pub fn encode<N, M>(input: [u8; N], mut result: [u8; M], url_safe: bool) -> [u8; M] {
    assert(N as u32 < MAX_INPUT_LEN, "input is too long. Max input length is 600");
    assert(base64_calculate_length(input) == M);

    let mut max_result = [0; MAX_INPUT_LEN];
    let mut max_input = [0; MAX_RESULT_LEN];
    if (N as u32 <= MAX_INPUT_LEN) {
        for i in 0..input.len() {
            max_input[i] = input[i];
        }
        for i in 0..((N as u32) / 3 + 1) {
            let chunk = if i * 3 + 2 < N as u32 {
                convert_chunk([max_input[i * 3], max_input[i * 3 + 1], max_input[i * 3 + 2]], url_safe)
            } else if i * 3 + 1 < N as u32 {
                convert_chunk([max_input[i * 3], max_input[i * 3 + 1]], url_safe)
            } else {
                convert_chunk([max_input[i * 3]], url_safe)
            };
            for j in 0..4 {
                max_result[i * 4 + j] = chunk[j];
            }
        }

        for i in 0..result.len() {
            result[i] = max_result[i];
        }
    }
    result
}

fn convert_chunk<N>(input: [u8; N], url_safe: bool) -> [u8; 4] {
    let input_len : u32 = input.len() as u32;
    assert(input_len > 0 & input_len <= 3, "convert_chunk only accepts arrays of length 1, 2 and 3");
    let mut result = [64; 4];

    let input0_first6 = input[0] >> 2;
    let input0_last2 = std::wrapping_shift_left(input[0], 6) >> 2;

    result[0] = input0_first6;
    result[1] = input0_last2;
    if input_len > 1 {
        let input1_first4 = input[1] >> 4;
        let input1_last4 = std::wrapping_shift_left(input[1], 4) >> 2;

        result[1] += input1_first4;
        result[2] = input1_last4;

        if input_len > 2 {
            let input2_first2 = input[2] >> 6;
            let input2_last6 = std::wrapping_shift_left(input[2], 2) >> 2;

            result[2] += input2_first2;
            result[3] = input2_last6;
        }
    }
    for i in 0..4 {
        result[i] = convert_base64_number(result[i], url_safe);
    }
    result
}

fn base64_calculate_length<N>(input: [u8; N]) -> u32 {
    let remainder: u32 = (input.len() as u32) % 3;
    4 * (input.len() as u32 / 3 + if remainder == 0 { 0 } else { 1 })
}

fn convert_base64_number(n: u8, url_safe: bool) -> u8 {
    if n >= 0 & n <= 25 {
        n + 65
    } else if n >= 26 & n <= 51 {
        n + 71
    } 
    else if n == 52 { 48 }
    else if n == 53 { 49 }
    else if n == 54 { 50 }
    else if n == 55 { 51 }
    else if n == 56 { 52 }
    else if n == 57 { 53 }
    else if n == 58 { 54 }
    else if n == 59 { 55 }
    else if n == 60 { 56 }
    else if n == 61 { 57 }
    else if n == 62 { 
        if url_safe { 45 } else { 43 }
    }
    else if n == 63 { 
        if url_safe { 95 } else { 47 }
    } else if n == 64 { 61}
    else { 
        assert(false, "convert_base64_number only accepts numbers between 0 and 64");
        0 
    } as u8
}

#[test]
fn test_encode_str() {
    assert_eq(encode_str("", []), []);
    assert_eq(encode_str("f", [0; 4]), as_bytes("Zg=="));
    assert_eq(encode_str("fo", [0; 4]), as_bytes("Zm8="));
    assert_eq(encode_str("foo", [0; 4]), as_bytes("Zm9v"));
    assert_eq(encode_str("foob", [0; 8]), as_bytes("Zm9vYg=="));
    assert_eq(encode_str("fooba", [0; 8]), as_bytes("Zm9vYmE="));
    assert_eq(encode_str("foobar", [0; 8]), as_bytes("Zm9vYmFy"));
}

#[test]
fn test_base64_calculate_length() {
    assert_eq(base64_calculate_length([0; 0]), 0);
    assert_eq(base64_calculate_length([0; 1]), 4);
    assert_eq(base64_calculate_length([0; 2]), 4);
    assert_eq(base64_calculate_length([0; 3]), 4);
    assert_eq(base64_calculate_length([0; 4]), 8);
    assert_eq(base64_calculate_length([0; 5]), 8);
    assert_eq(base64_calculate_length([0; 6]), 8);
    assert_eq(base64_calculate_length([0; 1000]), 1336);
}

#[test]
fn test_convert_base64_number() {
    assert_eq(as_byte("A"), convert_base64_number(0, true));
    assert_eq(as_byte("Z"), convert_base64_number(25, true));
    assert_eq(as_byte("a"), convert_base64_number(26, true));
    assert_eq(as_byte("z"), convert_base64_number(51, true));
    assert_eq(as_byte("0"), convert_base64_number(52, true));
    assert_eq(as_byte("9"), convert_base64_number(61, true));
    assert_eq(as_byte("-"), convert_base64_number(62, true));
    assert_eq(as_byte("_"), convert_base64_number(63, true));
    assert_eq(as_byte("="), convert_base64_number(64, true));

    assert_eq(as_byte("+"), convert_base64_number(62, false));
    assert_eq(as_byte("/"), convert_base64_number(63, false));
}

#[test]
fn test_convert_chunk() {
    // "f" -> "Zg=="
    assert_eq(convert_chunk([102], false), [90, 103, 61, 61]);
    // "fo" -> "Zm8="
    assert_eq(convert_chunk([102, 111], false), [90, 109, 56, 61]);
    // "foo" -> "Zm9v"
    assert_eq(convert_chunk([102, 111, 111], false), [90, 109, 57, 118]);
}

#[test(should_fail)]
fn test_convert_empty_chunk() -> [u8; 4] {
    convert_chunk([], true)
}

#[test(should_fail)]
fn test_convert_too_long_chunk() -> [u8; 4]  {
    convert_chunk([1, 2, 3, 4], true)
}

#[test(should_fail)]
fn test_input_is_too_long() -> [u8; 1200]  {
    encode([0; 900], [0; 1200], false)
}
