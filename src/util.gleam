import gleam/int
import gleam/string

pub fn eq(a: a, b: a) -> Bool {
  a == b
}

pub fn digit_to_int(c: String) -> Int {
  case int.parse(c) {
    Ok(n) -> n
    Error(_) -> 0
  }
}

pub fn is_digit(c: String) -> Bool {
  "1234567890"
  |> string.contains(c)
}
