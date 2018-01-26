import Foundation
import Result
import Swish

class FakeClient<T>: Client {
  var completionHandler: ((Result<T, SwishError>) -> Void)?

  @discardableResult
  func perform<U: Request>(
    _ request: U,
    completionHandler: @escaping (Result<U.ResponseObject, SwishError>) -> ()
  ) -> URLSessionDataTask {
    self.completionHandler = completionHandler
      as? ((Result<T, SwishError>) -> Void)
    return URLSessionDataTask()
  }

  func respond(with object: T) {
    completionHandler?(.success(object))
  }
}
