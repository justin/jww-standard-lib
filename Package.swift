// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "JWWCore",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(name: "JWWCore", targets: ["JWWCore"])
    ],
    dependencies: [ ],
    targets: [
        .target(name: "JWWCore", dependencies: []),
        .testTarget(name: "JWWCore-Tests", dependencies: ["JWWCore"])
    ]
)
