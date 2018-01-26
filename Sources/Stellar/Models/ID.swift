public struct ID<T>: Decodable, Equatable {
  public let value: String

  public static func == (lhs: ID, rhs: ID) -> Bool {
    return lhs.value == rhs.value
  }
}

extension ID: ExpressibleByStringLiteral {
  public typealias StringLiteralType = String

  public init(stringLiteral: String) {
    self.value = stringLiteral
  }
}
