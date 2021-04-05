// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "uAuthKit",
    defaultLocalization: "en",
    platforms: [
        .watchOS(.v7),
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "uAuthKit",
            targets: ["uAuthKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "uAuthKit",
            dependencies: [],
            path: "Sources",
            resources: [
                .process("Resources"),
//                .process("Resources/Localizable", localization: .default)
            ]
        ),
        .testTarget(
            name: "uAuthKitTests",
            dependencies: ["uAuthKit"]),
    ]
)