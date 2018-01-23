import Nimble
import Quick
import Stellar

class GetAccountSpec: QuickSpec {
  override func spec() {
    itBehavesLike(.getRequest, request: GetAccount(id: "test"))

    it("requests /accounts/{account id}") {
      let request = GetAccount(id: "test")

      expect(request.build()).to(hitEndpoint("/accounts/test"))
    }
  }
}
