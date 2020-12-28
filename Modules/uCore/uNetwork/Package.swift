// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "uNetwork",
    platforms: [
        .watchOS(.v7),
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "uNetwork",
            targets: ["uNetwork"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "uNetwork",
            dependencies: []),
        .testTarget(
            name: "uNetworkTests",
            dependencies: ["uNetwork"]),
    ]
)
