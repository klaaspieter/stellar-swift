extension Array {
  func removing(at index: Index) -> [Element] {
    var array = self
    array.remove(at: index)
    return array
  }
}
