// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIModules",
    products: [
        .library(
            name: "UIModules",
            targets: ["UIModules"]),
    ],
    dependencies: [
        .package(url: "https://github.com/cosmicfools/ModuleServices", .branch("master")),
    ],
    targets: [
        .target(
            name: "UIModules",
            dependencies: [
                .product(name: "ModuleServices", package: "ModuleServices"),
                .product(name: "ModuleGenericServices", package: "ModuleServices"),
            ]),
        .testTarget(
            name: "UIModulesTests",
            dependencies: ["UIModules"]),
    ]
)
