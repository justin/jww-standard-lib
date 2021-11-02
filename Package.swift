// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "JWWCore",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
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
