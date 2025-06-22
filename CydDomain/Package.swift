// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CydDomain",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "CydDomain", targets: ["CydDomain"])
    ],
    dependencies: [
        .package(path: "../CydCore")
    ],
    targets: [
        .target(
            name: "CydDomain",
            dependencies: ["CydCore"]
        )
    ]
)
