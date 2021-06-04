// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "JWWCore",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "JWWCore", targets: ["JWWCore"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "JWWCore", dependencies: []),
        .testTarget(name: "JWWCore-Tests", dependencies: ["JWWCore"])
    ]
)
