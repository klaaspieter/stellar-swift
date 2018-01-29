public struct Account: Codable {
  let id: ID<Account>
}

public func == (lhs: Account, rhs: Account) -> Bool {
  return lhs.id == rhs.id
}
extension Account: Equatable {}

