import gleam/int
import gleam/io
import gleam/option
import gleam/string

pub fn main() -> Nil {
  io.println("Hello from json_parser_from_scratch!")
}

type JValue {
  JNull
  JBool(Bool)
  JString(String)
  JNumber(Float)
  JArray(List(JValue))
  JObject(List(#(String, JValue)))
}

pub type Parser(i, o) {
  Parser(run_parser: fn(i) -> option.Option(#(i, o)))
}

fn satisfy(predicate: fn(String) -> Bool) -> Parser(String, String) {
  Parser(fn(input: String) -> option.Option(#(String, String)) {
    case string.to_graphemes(input) {
      [x, ..xs] ->
        case predicate(x) {
          True -> option.Some(#(string.concat(xs), x))
          False -> option.None
        }
      _ -> option.None
    }
  })
}

fn char1(s: String) -> Parser(String, String) {
  satisfy(eq(_, s))
}

fn eq(a: a, b: a) -> Bool {
  a == b
}
