pub fn map(t: #(_, a), f: fn(a) -> b) -> #(_, b) {
  let #(i, a) = t
  #(i, f(a))
}
