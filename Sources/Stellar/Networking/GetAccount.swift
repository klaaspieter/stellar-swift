import Foundation
import Swish

public struct GetAccount: Request {
  public typealias ResponseObject = Dictionary<String, Any?>

  public let id: String
  public let network: Network

  public init(id: String, network: Network) {
    self.id = id
    self.network = network
  }

  public func build() -> URLRequest {
    return URLRequest(
      url: URL(string: "/account/test", relativeTo: network.url)!
    )
  }
}
