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
    .package(url: "https://github.com/nerdishbynature/octokit.swift", branch: "main"),
    .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image", .upToNextMajor(from: "2.1.1")),
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
        .product(name: "OctoKit", package: "octokit.swift"),
        .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image")
      ]
    ),
  ]
)
