@testable import Stellar

extension Account {
  static func fake(id: ID<Account> = "") -> Account {
    return Account(id: id)
  }
}
