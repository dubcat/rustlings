// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftlings",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "swiftlings",
            targets: ["swiftlings"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "swiftlings",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Yams", package: "Yams"),
            ],
            path: "Sources/swiftlings"
        ),
        .testTarget(
            name: "swiftlingsTests",
            dependencies: ["swiftlings"],
            path: "Tests/swiftlingsTests"
        ),
    ]
)
