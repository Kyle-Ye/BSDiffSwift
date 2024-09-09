// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BSDiffSwift",
    products: [
        .library(name: "BSDiffSwift", targets: ["BSDiffSwift"]),
    ],
    targets: [
        .target(name: "CBSDiff", linkerSettings: [.linkedLibrary("bz2")]),
        .target(name: "BSDiffSwift", dependencies: ["CBSDiff"]),
        .testTarget(
            name: "BSDiffSwiftTests",
            dependencies: ["BSDiffSwift"],
            resources: [.process("Resources")]
        ),
    ]
)
