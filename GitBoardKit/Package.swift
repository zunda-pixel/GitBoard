// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "GitBoardKit",
  platforms: [.iOS(.v17), .macOS(.v14)],
  products: [
    .library(
      name: "GitBoardKit",
      targets: ["GitBoardKit"]
    ),
  ],
  targets: [
    .target(name: "GitBoardKit"),
  ]
)
