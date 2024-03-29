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
    .package(url: "https://github.com/zunda-pixel/GitHubKit", branch: "main"),
    .package(url: "https://github.com/kean/Nuke", .upToNextMajor(from: "12.1.6")),
    .package(url: "https://github.com/zunda-pixel/ToastView", branch: "main"),
    .package(url: "https://github.com/apple/swift-algorithms", .upToNextMajor(from: "1.0.0")),
    .package(url: "https://github.com/apple/swift-format", .upToNextMajor(from: "508.0.1")),
    .package(url: "https://github.com/sindresorhus/Defaults", .upToNextMajor(from: "7.2.0")),
    .package(url: "https://github.com/zunda-pixel/MarkdownView", branch: "main"),
    .package(url: "https://github.com/safx/Emoji-Swift", branch: "master"),
    .package(url: "https://github.com/square/Valet", .upToNextMajor(from: "4.2.0")),
    .package(url: "https://github.com/pointfreeco/swift-tagged", .upToNextMajor(from: "0.1.0")),
  ],
  targets: [
    .target(
      name: "GitBoardUI",
      dependencies: [
        .target(name: "GitBoardData"),
        .product(name: "ToastView", package: "ToastView"),
        .product(name: "Nuke", package: "Nuke"),
        .product(name: "NukeUI", package: "Nuke"),
        .product(name: "Algorithms", package: "swift-algorithms"),
        .product(name: "Defaults", package: "Defaults"),
        .product(name: "MarkdownView", package: "MarkdownView"),
        .product(name: "Emoji", package: "Emoji-Swift"),
        .product(name: "Valet", package: "Valet"),
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
        .product(name: "Tagged", package: "swift-tagged"),
      ]
    ),
  ]
)
