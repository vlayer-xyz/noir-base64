fn base64_calculate_length<N>(input: [u8; N]) -> u32 {
    let remainder: u32 = (input.len() as u32) % 3;

    4 * (input.len() as u32 / 3 + if remainder == 0 { 0 } else { 1 })
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
