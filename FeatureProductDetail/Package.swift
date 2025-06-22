// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureProductDetail",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "FeatureProductDetailInterface", targets: ["FeatureProductDetailInterface"]),
        .library(name: "FeatureProductDetail", targets: ["FeatureProductDetail"]),
    ],
    dependencies: [
        .package(path: "../CydCore"),
        .package(path: "../CydDesignSystem"),
        .package(path: "../CydDomain")
    ],
    targets: [
        .target(
            name: "FeatureProductDetailInterface",
            dependencies: []
        ),
        .target(
            name: "FeatureProductDetail",
            dependencies: [
                "FeatureProductDetailInterface",
                .product(name: "CydCore", package: "CydCore"),
                .product(name: "CydDesignSystem", package: "CydDesignSystem"),
                .product(name: "CydDomain", package: "CydDomain")
            ]
        ),
        .testTarget(
            name: "FeatureProductDetailTests",
            dependencies: ["FeatureProductDetail"]
        )
    ]
)
