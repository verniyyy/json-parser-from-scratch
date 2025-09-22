import gleam/option
import gleam/string
import tuple
import util

pub type Parser(i, o) {
  Parser(run_parser: fn(i) -> option.Option(#(i, o)))
}

pub fn map(p: Parser(_, a), f: fn(a) -> b) -> Parser(_, b) {
  fn(input: i) -> option.Option(#(i, b)) {
    input
    |> p.run_parser
    |> option.map(tuple.map(_, f))
  }
  |> Parser
}

fn satisfy(predicate: fn(String) -> Bool) -> Parser(String, String) {
  fn(input: String) -> option.Option(#(String, String)) {
    case string.to_graphemes(input) {
      [x, ..xs] ->
        case predicate(x) {
          True -> option.Some(#(string.concat(xs), x))
          False -> option.None
        }
      _ -> option.None
    }
  }
  |> Parser
}

fn char(s: String) -> Parser(String, String) {
  util.eq(_, s)
  |> satisfy
}

fn digit() -> Parser(String, Int) {
  util.is_digit
  |> satisfy
  |> map(util.digit_to_int)
}
