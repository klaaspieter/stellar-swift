import Foundation
import Swish

public struct GetAccount: Request {
  public typealias ResponseObject = Account

  public let id: String
  public let network: Network

  public init(id: String, network: Network) {
    self.id = id
    self.network = network
  }

  public func build() -> URLRequest {
    return network.request(for: .account(id: id))
  }
}
