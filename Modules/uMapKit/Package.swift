// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "uMapKit",
    platforms: [
        .watchOS(.v7),
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "uMapKit",
            targets: ["uMapKit"]),
    ],
    dependencies: [
        .package(path: "Modules/uCore"),
        .package(path: "Modukes/uNetwork")
    ],
    targets: [
        .target(
            name: "uMapKit",
            dependencies: [
                .product(name: "uCore", package: "uCore"),
                .product(name: "uNetwork", package: "uNetwork")
            ],
            path: "Sources"),
        .testTarget(
            name: "uMapKitTests",
            dependencies: ["uMapKit"]),
    ]
)
