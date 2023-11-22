pub fn as_byte(s: str<1>) -> u8 {
    s.as_bytes()[0]
}

#[test]
fn test_as_byte() {
    assert_eq(97, as_byte("a"));
    assert_eq(65, as_byte("A"));
    assert_eq(35, as_byte("#"));
}