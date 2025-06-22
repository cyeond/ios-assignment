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
        .package(name: "CydDesignSystem", path: "../CydDesignSystem"),
        .package(name: "CydDomain", path: "../CydDomain"),
        .package(name: "FeatureProductDetail", path: "../FeatureProductDetail"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0")
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
                .product(name: "CydDesignSystem", package: "CydDesignSystem"),
                .product(name: "CydDomain", package: "CydDomain"),
                .product(name: "FeatureProductDetailInterface", package: "FeatureProductDetail"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ]
        ),
        .testTarget(
            name: "FeatureHomeTests",
            dependencies: ["FeatureHome"]
        )
    ]
)
