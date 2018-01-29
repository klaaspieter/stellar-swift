public struct Account: Codable {
  public let id: ID<Account>

  public let balances: [Balance]
}

public func == (lhs: Account, rhs: Account) -> Bool {
  return lhs.id == rhs.id
}
extension Account: Equatable {}

