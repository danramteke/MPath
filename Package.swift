// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "MPath",
    products: [
        .library(name: "MPath", targets: ["MPath"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "MPath", dependencies: []),
        .testTarget(name: "MPathTests", dependencies: ["MPath"]),
    ]
)
