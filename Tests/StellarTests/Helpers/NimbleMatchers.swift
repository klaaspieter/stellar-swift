import Foundation
import Nimble
import Quick
import Swish

func itBehavesLike<T: Request>(_ behavior: APIRequestBehavior, request: T) {
  itBehavesLike(behavior.rawValue) {
    ["request": request.build()]
  }
}

func hitEndpoint<T: Request>(_ path: String) -> Predicate<T> {
  return Predicate.define(matcher: { actualExpression in
    let request = try actualExpression.evaluate()
    let message: ExpectationMessage

    guard let url = request?.build().url else {
      message = .fail("expected request to not be nil")
      return PredicateResult(status: .fail, message: message)
    }

    message = ExpectationMessage.fail("expected path of <\(url)> to end in <\(path)>")

    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    guard components?.path.hasSuffix(path) == true else {
      return PredicateResult(status: .fail, message: message)
    }

    return PredicateResult(status: .matches, message: message)
  })
}
