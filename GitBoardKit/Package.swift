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
      targets: ["GitBoardData"]
    ),
    .library(
      name: "GitBoardUI",
      targets: ["GitBoardUI"]
    ),
  ],
  targets: [
    .target(
      name: "GitBoardData"
    ),
    .target(
      name: "GitBoardUI"
    )
  ]
)
