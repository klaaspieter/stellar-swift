import Foundation
import Stellar

func printUsage() -> Never {
  exit(
    message:
      """
      Stellar

      Usage:
        stellar accounts <id> [--network=NETWORK]
        stellar -h|--help
        stellar -v|--version

      Options:
        -h --help                    Show this screen.
        --version                    Show version.
        --network=[main|test|URL]    The network to use. “main”, “test” or a URL for a non-default network. [Default: test]
      """,
    code: 0
  )
}

func exit(message: String, code: Int32) -> Never {
  print(message)
  exit(code)
}

func isOption(short: String, long: String) -> (String) -> Bool {
  return { option in return option == short || option == long }
}

let arguments = CommandLine.arguments.removing(at: 0)
guard !arguments.isEmpty,
  !arguments.contains(where: isOption(short: "-h", long: "--help"))
else {
  printUsage()
}

guard !arguments.contains(
  where: isOption(short: "-v", long: "--version")
) else {
  exit(message: "1.0.0", code: 0)
}

let network: Network
if let index = arguments.index(of: "--network"),
  let networkIndex = arguments.index(
    index,
    offsetBy: 1,
    limitedBy: arguments.endIndex
  )
{

  if let n = Network(string: arguments[networkIndex]) {
    network = n
  } else {
    print("Invalid network URL. Using test network instead")
    network = .test
  }
} else {
  network = .test
}

func parseAccounts(arguments: [String]) {
  guard let accountID = arguments[safe: 0] else {
    exit(message: "Account ID is required", code: 1)
  }
  network.getAccount(id: accountID, completionHandler: { result in
    print(result)
    exit(0)
  })

  RunLoop.main.run()
}

switch arguments[0] {
case "accounts":
  parseAccounts(arguments: Array(arguments[safe: 1..<2]))

default:
  printUsage()
}
