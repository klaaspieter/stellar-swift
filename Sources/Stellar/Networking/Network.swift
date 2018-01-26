import Foundation

public struct Network {
  public let url: URL

  public static let test = Network(
    url: URL(string: "https://horizon-testnet.stellar.org/")!
  )
  public static let main = Network(
    url: URL(string: "https://horizon.stellar.org/")!
  )

  public init(url: URL) {
    self.url = url
  }

  func request(for resource: Resource) -> URLRequest {
    let url = URL(string: resource.pathComponent, relativeTo: self.url)!

    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    return request
  }
}
