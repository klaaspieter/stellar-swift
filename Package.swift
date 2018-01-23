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
  dependencies: [],
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
      dependencies: ["stellar-framework"]
    ),
  ]
)
