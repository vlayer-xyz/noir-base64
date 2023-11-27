use dep::base64;
use dep::std;

fn main() {
    let result: [u8; 8] = base64::encode_str("foobar", [0; 8], false);
    std::println(result);
}

#[test]
fn test_main() {
    main();
}
