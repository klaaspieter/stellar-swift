import Foundation
import Stellar

extension Network {
  init?(string: String) {
    switch string {
    case "test":
      self.init(url: Network.test.url)
    case "main":
      self.init(url: Network.main.url)

    default:
      guard let url = URL(string: string) else {
        return nil
      }

      self.init(url: url)
    }
  }
}
