// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataBase",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataBase",
            targets: ["DataBase"]),
    ],
    dependencies: [
        .package(name: "AssetModule", path: "../AssetModule")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataBase",
            dependencies: ["AssetModule"]
        ),
        .testTarget(
            name: "DataBaseTests",
            dependencies: ["DataBase"]),
    ]
)
