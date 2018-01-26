import Foundation
import Nimble
import Quick
import Result
import Stellar
import Swish

class NetworkSpec: QuickSpec {
  override func spec() {
    describe("getAccount") {
      it("returns an account") {
        let client = FakeClient<Account>()
        let network = Network(
          url: URL(string: "https://fake")!,
          client: client
        )
        let account = Account.fake()

        var result: Result<Account, SwishError>?
        network.getAccount(id: "account id") { result = $0 }
        client.respond(with: account)

        expect(result?.value) == account
      }
    }
  }
}
