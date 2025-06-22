// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CydDesignSystem",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CydDesignSystem",
            targets: ["CydDesignSystem"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "CydDesignSystem",
            dependencies: [
                "SnapKit"
            ]
        )
    ]
)
