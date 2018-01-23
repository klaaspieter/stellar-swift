import Foundation
import Swish

public struct GetAccount: Request {
  public typealias ResponseObject = Dictionary<String, Any?>

  public func build() -> URLRequest {
    return URLRequest(url: URL(string: "http://example.org")!)
  }
}
