@testable import Stellar

extension Account {
  static func fake(
    id: ID<Account> = "",
    balances: [Balance] = [.fake()]
  ) -> Account {
    return Account(id: id, balances: balances)
  }
}
