public struct Account: Decodable {
  let id: String
}

public func == (lhs: Account, rhs: Account) -> Bool {
  return lhs.id == rhs.id
}
extension Account: Equatable {}

