mod utils;
use crate::utils::as_byte;

fn base64_calculate_length<N>(input: [u8; N]) -> u32 {
    let remainder: u32 = (input.len() as u32) % 3;

    4 * (input.len() as u32 / 3 + if remainder == 0 { 0 } else { 1 })
}

fn convert_base64_number(n: u8) -> u8 {
    let mut result: u8 = 0;
    if n >= 0 & n <= 25 {
        result = n + 65;
    } else if n >= 26 & n <= 51 {
        result = n + 71;
    } 
    else if n == 52 { result = 48; }
    else if n == 53 { result = 49; }
    else if n == 54 { result = 50; }
    else if n == 55 { result = 51; }
    else if n == 56 { result = 52; }
    else if n == 57 { result = 53; }
    else if n == 58 { result = 54; }
    else if n == 59 { result = 55; }
    else if n == 60 { result = 56; }
    else if n == 61 { result = 57; }
    else if n == 62 { result = 45; }
    else if n == 63 { result = 95; }
    result
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
    assert_eq(as_byte("A"), convert_base64_number(0));
    assert_eq(as_byte("Z"), convert_base64_number(25));
    assert_eq(as_byte("a"), convert_base64_number(26));
    assert_eq(as_byte("z"), convert_base64_number(51));
    assert_eq(as_byte("0"), convert_base64_number(52));
    assert_eq(as_byte("9"), convert_base64_number(61));
    assert_eq(as_byte("-"), convert_base64_number(62));
    assert_eq(as_byte("_"), convert_base64_number(63));
}
