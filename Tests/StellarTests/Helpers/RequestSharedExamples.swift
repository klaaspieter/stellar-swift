import Foundation
import Nimble
import Quick
import Result
import Stellar
import Swish

enum APIRequestBehavior: String {
  case baseRequest = "an API request"
  case getRequest = "a GET request"
}


private func makeRequest(
  from context: SharedExampleContext
) -> URLRequest {
  return context()["request"] as! URLRequest
}

class RequestSharedExamplesConfiguration: QuickConfiguration {
  override class func configure(_ configuration: Configuration) {
    sharedExamples(APIRequestBehavior.getRequest.rawValue) { context in
      itBehavesLike(
        APIRequestBehavior.baseRequest.rawValue,
        sharedExampleContext: context
      )

      it("is a GET request") {
        let request = makeRequest(from: context)

        expect(request.httpMethod) == RequestMethod.GET.rawValue
      }
    }

    sharedExamples(APIRequestBehavior.baseRequest.rawValue) { context in
      it("points to a Network url") {
        let network = context()["network"] as! Network
        let urlRequest = makeRequest(from: context)

        expect(urlRequest.url?.absoluteString).to(beginWith(network.url.absoluteString))
      }

      it("has an accept of 'application.json'") {
        let request = makeRequest(from: context)

        expect(request.allHTTPHeaderFields?["Accept"]) == "application/json"
      }
    }
  }

}
