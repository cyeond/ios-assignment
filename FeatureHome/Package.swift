// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureHome",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "FeatureHomeInterface", targets: ["FeatureHomeInterface"]),
        .library(name: "FeatureHome", targets: ["FeatureHome"])
    ],
    dependencies: [
        .package(name: "CydCore", path: "../CydCore"),
        .package(name: "CydDesignSystem", path: "../CydDesignSystem")
    ],
    targets: [
        .target(
            name: "FeatureHomeInterface",
            dependencies: []
        ),
        .target(
            name: "FeatureHome",
            dependencies: [
                "FeatureHomeInterface",
                .product(name: "CydCore", package: "CydCore"),
                .product(name: "CydDesignSystem", package: "CydDesignSystem")
            ]
        ),
        .testTarget(
            name: "FeatureHomeTests",
            dependencies: ["FeatureHome"]
        )
    ]
)
