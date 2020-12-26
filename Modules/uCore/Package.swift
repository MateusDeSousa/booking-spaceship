// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "uCore",
    platforms: [
        .watchOS(.v7),
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "uCore",
            targets: ["uCore"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "uCore",
            dependencies: [],
            path: "Sources"),
        
        .testTarget(
            name: "uCoreTests",
            dependencies: ["uCore"]),
    ]
)
