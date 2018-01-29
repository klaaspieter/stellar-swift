extension Array {
  func removing(at index: Index) -> [Element] {
    var array = self
    array.remove(at: index)
    return array
  }

  subscript(safe index: Index) -> Element? {
    return indices ~= index ? self[index] : .none
  }

  subscript(safe range: Range<Index>) -> ArraySlice<Element> {
    let from = index(
      startIndex,
      offsetBy: range.lowerBound,
      limitedBy: endIndex
    ) ?? endIndex
    let to = index(
      startIndex,
      offsetBy: range.upperBound,
      limitedBy: endIndex
    ) ?? endIndex
    return self[from..<to]
  }
}
