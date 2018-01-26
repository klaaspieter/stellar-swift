import Foundation

public enum Resource {
  case account(id: String)

  var pathComponent: String {
    switch self {
    case .account(let id):
      return "accounts/\(id)"
    }
  }
}
