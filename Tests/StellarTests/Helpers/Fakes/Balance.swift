@testable import Stellar

extension Balance {
  static func fake(
    balance: String = "9999",
    type: String = "native"
  ) -> Balance {
    return Balance(balance: balance, type: type)
  }
}
