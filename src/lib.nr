mod utils;
use crate::utils::as_byte;

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
