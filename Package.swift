// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusInMobiAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusInMobiAdapter",
            targets: ["TradPlusInMobiAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/InMobi/InMobiSDK-Swift-Package.git",
            .exact("11.5.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusInMobiAdapter",
            dependencies: [
                .target(name: "TPInMobiAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "InMobiSDK", package: "InMobiSDK-Swift-Package"),
            ],
            path: ".",
            sources: ["Sources/TradPlusInMobiAdapter/TradPlusInMobiAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPInMobiAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-InMobi/releases/download/15.18.0/TPInMobiAdapter-15.18.0.xcframework.zip",
            checksum: "3a6ac465874e545afe1e65520e8c73b7d32d7f3dd694a31cb1f98b079e41880c"
        ),
    ]
)
