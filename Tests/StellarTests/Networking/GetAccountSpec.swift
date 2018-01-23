import Nimble
import Quick
import Stellar

class GetAccountSpec: QuickSpec {
  override func spec() {
    it("requests /accounts/{account id}") {
      let request = GetAccount(id: "test")

      expect(request).to(hitEndpoint("/accounts/test"))
    }
  }
}
