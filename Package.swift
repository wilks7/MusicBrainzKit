// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MusicBrainzKit",
    platforms: [.macOS(.v13), .iOS(.v16), .tvOS(.v14), .watchOS(.v9), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MusicBrainzKit",
            targets: ["MusicBrainzKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wilks7/DrillURL.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MusicBrainzKit",
            dependencies: [
                .product(name: "DrillURL", package: "DrillURL")
            ]
        ),
        .testTarget(
            name: "MusicBrainzKitTests",
            dependencies: [
                "MusicBrainzKit",
                .product(name: "DrillURL", package: "DrillURL")

            ]
        ),
    ]
)
