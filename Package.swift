// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "JWWCore",
    platforms: [
        .iOS(.v14),
        .macCatalyst(.v14),
        .macOS(.v11)
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
