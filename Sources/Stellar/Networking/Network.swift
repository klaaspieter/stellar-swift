import Foundation
import Result
import Swish

public struct Network {
  public let url: URL

  private let client: Client

  public static let test = Network(
    url: URL(string: "https://horizon-testnet.stellar.org/")!
  )
  public static let main = Network(
    url: URL(string: "https://horizon.stellar.org/")!
  )

  public init(url: URL, client: Client = APIClient()) {
    self.url = url
    self.client = client
  }

  public func getAccount(
    id: String,
    completionHandler: @escaping (Result<Account, SwishError>) -> Void
  ) {
    let request = GetAccount(id: id, network: self)
    client.perform(request, completionHandler: completionHandler)
  }

  func request(for resource: Resource) -> URLRequest {
    let url = URL(string: resource.pathComponent, relativeTo: self.url)!

    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    return request
  }
}
