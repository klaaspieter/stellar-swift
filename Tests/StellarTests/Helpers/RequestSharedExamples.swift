import Foundation
import Nimble
import Quick
import Swish

enum APIRequestBehavior: String {
  case baseRequest = "an API request"
  case getRequest = "a GET request"
}

private func makeRequest(from context: SharedExampleContext) -> URLRequest {
  return context()["request"] as! URLRequest
}

class RequestSharedExamplesConfiguration: QuickConfiguration {
  override class func configure(_ configuration: Configuration) {
    sharedExamples(APIRequestBehavior.getRequest.rawValue) { context in

      it("is a GET request") {
        let request = makeRequest(from: context)

        expect(request.httpMethod) == RequestMethod.GET.rawValue
      }
    }
  }

}
