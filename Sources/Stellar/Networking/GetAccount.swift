import Foundation
import Swish

public struct GetAccount: Request {
  public typealias ResponseObject = Dictionary<String, Any?>

  public let id: String

  public init(id: String) {
    self.id = id
  }

  public func build() -> URLRequest {
    return URLRequest(url: URL(string: "http://example.org/accounts/test")!)
  }
}
