// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NimanderKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BookmarkClient",
            targets: ["BookmarkClient"]),
        .library(
            name: "AppModels",
            targets: ["AppModels"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "BookmarkClient",
            dependencies: ["AppModels"]),
        .testTarget(
            name: "BookmarkClientTests",
            dependencies: ["BookmarkClient"]),
        .target(
            name: "AppModels",
            dependencies: []),
        .testTarget(
            name: "AppModelsTests",
            dependencies: ["AppModels"])
    ]
)
