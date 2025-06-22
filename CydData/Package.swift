// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CydData",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "CydData", targets: ["CydData"])
    ],
    dependencies: [
        .package(path: "../CydDomain"),
        .package(path: "../CydCore")
    ],
    targets: [
        .target(
            name: "CydData",
            dependencies: ["CydDomain", "CydCore"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
