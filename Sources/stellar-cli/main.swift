import Foundation

func printUsage() {
  print(
    """
    Stellar

    Usage:
      stellar accounts <id> [--network=NETWORK]
      stellar -h|--help
      stellar --version

    Options:
      -h --help                    Show this screen.
      --version                    Show version.
      --network=[main|test|URL]    The network to use. “main”, “test” or a URL for a non-default network. [Default: test]
    """
  )
}

guard CommandLine.arguments.count > 1 else {
  printUsage()
  exit(0)
}
