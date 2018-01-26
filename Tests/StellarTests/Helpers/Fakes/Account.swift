@testable import Stellar

extension Account {
  static func fake(id: String = "") -> Account {
    return Account(id: id)
  }
}
