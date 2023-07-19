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
    .package(url: "https://github.com/zunda-pixel/GitHubKit", branch: "develop/add-forks"),
    .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image", .upToNextMajor(from: "2.1.1")),
    .package(url: "https://github.com/evgenyneu/keychain-swift", .upToNextMajor(from: "20.0.0")),
    .package(url: "https://github.com/zunda-pixel/ToastView", branch: "main"),
    .package(url: "https://github.com/apple/swift-algorithms", .upToNextMajor(from: "1.0.0")),
    .package(url: "https://github.com/apple/swift-format", .upToNextMajor(from: "508.0.1")),
  ],
  targets: [
    .target(
      name: "GitBoardUI",
      dependencies: [
        .target(name: "GitBoardData"),
        .product(name: "ToastView", package: "ToastView"),
        .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image"),
        .product(name: "KeychainSwift", package: "keychain-swift"),
        .product(name: "Algorithms", package: "swift-algorithms"),
      ],
      swiftSettings: [
        // https://github.com/uhooi/Loki/blob/main/LokiPackage/Package.swift
        .unsafeFlags(["-Xfrontend", "-warn-long-expression-type-checking=500"], .when(configuration: .debug)),
        .unsafeFlags(["-Xfrontend", "-warn-long-function-bodies=500"], .when(configuration: .debug)),
        .unsafeFlags(["-strict-concurrency=targeted"], .when(configuration: .debug)), // TODO targeted -> complete
        .unsafeFlags(["-enable-actor-data-race-checks"], .when(configuration: .debug)),
        .enableUpcomingFeature("ConciseMagicFile", .when(configuration: .debug)), // SE-0274
        .enableUpcomingFeature("ForwardTrailingClosures", .when(configuration: .debug)), // SE-0286
        .enableUpcomingFeature("ExistentialAny", .when(configuration: .debug)), // SE-0335
        .enableUpcomingFeature("BaseSlashRegexLiterals", .when(configuration: .debug)), // SE-0354
      ]
    ),
    .target(
      name: "GitBoardData",
      dependencies: [
        .product(name: "GitHubAPI", package: "GitHubKit"),
      ]
    ),
  ]
)
