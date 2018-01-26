import Swish

public protocol Request: Swish.Request {
  var network: Network { get }
}
