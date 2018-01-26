import Nimble
import Quick
import Stellar

class GetAccountSpec: QuickSpec {
  override func spec() {
    itBehavesLike(.getRequest, request: GetAccount(id: "test", network: .test))

    it("requests /accounts/{account id}") {
      let request = GetAccount(id: "test", network: .test)

      expect(request).to(hitEndpoint("/accounts/test"))
    }
  }
}
