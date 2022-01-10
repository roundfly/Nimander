// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NimanderKit",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "BookmarkClient",
            targets: ["BookmarkClient"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BookmarkClient",
            dependencies: []),
        .testTarget(
            name: "BookmarkClientTests",
            dependencies: ["BookmarkClient"])
    ]
)
