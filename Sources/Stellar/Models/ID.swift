public struct ID<T>: Codable, Equatable {
  public let value: String

  init(value: String) {
    self.value = value
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    value = try container.decode(String.self)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }

  public static func == (lhs: ID, rhs: ID) -> Bool {
    return lhs.value == rhs.value
  }
}

extension ID: CustomStringConvertible {
  public var description: String {
    return self.value
  }
}

extension ID: ExpressibleByStringLiteral {
  public typealias StringLiteralType = String

  public init(stringLiteral: String) {
    self.value = stringLiteral
  }
}
