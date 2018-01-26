// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "stellar-swift",
  products: [
    .library(
      name: "Stellar",
      targets: ["Stellar"]
    ),
    .executable(
      name: "stellar",
      targets: ["stellar-cli"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.3"),
    .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
    .package(url: "https://github.com/klaaspieter/Swish.git", .branch("kp-spm")),
  ],
  targets: [
    .target(
      name: "Stellar",
      dependencies: ["Swish"]
    ),
    .target(
      name: "stellar-cli",
      dependencies: ["Stellar"]
    ),
    .testTarget(
      name: "StellarTests",
      dependencies: ["Stellar", "Quick", "Nimble"]
    ),
  ]
)
