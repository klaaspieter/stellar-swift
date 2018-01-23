// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "stellar-swift",
  products: [
    .library(
      name: "stellar",
      targets: ["stellar-framework"]
    ),
    .executable(
      name: "stellar",
      targets: ["stellar-cli"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.3"),
    .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
  ],
  targets: [
    .target(
      name: "stellar-framework",
      dependencies: []
    ),
    .target(
      name: "stellar-cli",
      dependencies: ["stellar-framework"]
    ),
    .testTarget(
      name: "stellar-frameworkTests",
      dependencies: ["stellar-framework", "Quick", "Nimble"]
    ),
  ]
)
