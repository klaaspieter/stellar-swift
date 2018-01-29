public struct Balance: Codable {
  let balance: String
  let type: String

  enum CodingKeys: String, CodingKey {
    case balance = "balance"
    case type = "asset_type"
  }
}

public func == (lhs: Balance, rhs: Balance) -> Bool {
  return lhs.balance == rhs.balance
    && lhs.type == rhs.type
}
extension Balance: Equatable {}
