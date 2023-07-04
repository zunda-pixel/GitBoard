// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GitBoardKit",
  platforms: [
    .iOS(.v17),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "GitBoardData",
      type: .dynamic,
      targets: ["GitBoardData"]
    ),
    .library(
      name: "GitBoardUI",
      type: .dynamic,
      targets: ["GitBoardUI"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/zunda-pixel/GitHubKit", branch: "add-search-api"),
    .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image", .upToNextMajor(from: "2.1.1")),
    .package(url: "https://github.com/evgenyneu/keychain-swift", .upToNextMajor(from: "20.0.0")),
  ],
  targets: [
    .target(
      name: "GitBoardUI",
      dependencies: [
        .target(name: "GitBoardData"),
      ]
    ),
    .target(
      name: "GitBoardData",
      dependencies: [
        .product(name: "GitHubKit", package: "GitHubKit"),
        .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image"),
        .product(name: "KeychainSwift", package: "keychain-swift"),
      ]
    ),
  ]
)
