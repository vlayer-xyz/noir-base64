mod utils;

use dep::std;
use crate::utils::as_byte;

fn convert_chunk<N>(input: [u8; N], url: bool) -> [u8; 4] {
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
        result[i] = convert_base64_number(result[i], url);
    }
    result
}

fn base64_calculate_length<N>(input: [u8; N]) -> u32 {
    let remainder: u32 = (input.len() as u32) % 3;
    4 * (input.len() as u32 / 3 + if remainder == 0 { 0 } else { 1 })
}

fn convert_base64_number_url(n: u8) -> u8 {
    convert_base64_number(n, true)
}

fn convert_base64_number(n: u8, url: bool) -> u8 {
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
        if url { 45 } else { 43 }
     }
    else if n == 63 { 
        if url { 95 } else { 47 }
    } else if n == 64 { 61}
    else { 
        assert(false, "convert_base64_number only accepts numbers between 0 and 64");
        0 
    }
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
    assert_eq(as_byte("A"), convert_base64_number_url(0));
    assert_eq(as_byte("Z"), convert_base64_number_url(25));
    assert_eq(as_byte("a"), convert_base64_number_url(26));
    assert_eq(as_byte("z"), convert_base64_number_url(51));
    assert_eq(as_byte("0"), convert_base64_number_url(52));
    assert_eq(as_byte("9"), convert_base64_number_url(61));
    assert_eq(as_byte("-"), convert_base64_number_url(62));
    assert_eq(as_byte("_"), convert_base64_number_url(63));
    assert_eq(as_byte("="), convert_base64_number_url(64));
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
