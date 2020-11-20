// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreModule",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CoreModule",
            targets: ["CoreModule"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "../NetworkModule", from: "1.0.0"),
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", .exact("10.1.4")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CoreModule",
            dependencies: ["NetworkModule", .product(name: "RealmSwift", package: "Realm")]),
        .testTarget(
            name: "CoreModuleTests",
            dependencies: ["CoreModule"]),
    ]
)
