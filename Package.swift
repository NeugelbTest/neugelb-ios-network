// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "NeugelbNetwork",
    platforms: [
        .iOS(.v15),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "NeugelbNetwork",
            targets: ["NeugelbNetwork"]),
    ],
    targets: [
        .target(
            name: "NeugelbNetwork",
            path: "./Sources"),
        .testTarget(
            name: "NeugelbNetworkTests",
            dependencies: ["NeugelbNetwork"]
        ),
    ]
)
