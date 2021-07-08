// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MPath",
    platforms: [
		.macOS(.v10_15)
	],
    products: [
        .library(name: "MPath", targets: ["MPath"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "MPath", dependencies: []),
        .testTarget(name: "MPathTests", dependencies: ["MPath"]),
    ]
)
