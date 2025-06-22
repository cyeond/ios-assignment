// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CydCore",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CydCore",
            targets: ["CydCore"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "CydCore",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift")
            ]
        ),
        .testTarget(
            name: "CydCoreTests",
            dependencies: ["CydCore"]
        )
    ]
)
