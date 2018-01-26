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
}
