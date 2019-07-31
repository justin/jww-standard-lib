// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JWWCore",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v5),
    ],
    products: [
        .library(name: "JWWCore", targets: ["JWWCore"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "JWWCore", dependencies: []),
    ]
)
