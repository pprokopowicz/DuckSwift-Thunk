// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DuckSwift-Thunk",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DuckSwift-Thunk",
            targets: ["DuckSwift-Thunk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pprokopowicz/DuckSwift.git", from: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DuckSwift-Thunk",
            dependencies: [
                .product(name: "DuckSwift", package: "DuckSwift")
            ]),
        .testTarget(
            name: "DuckSwift-ThunkTests",
            dependencies: ["DuckSwift-Thunk"]),
    ]
)