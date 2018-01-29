import Foundation

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
