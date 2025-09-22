import gleam/io

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
