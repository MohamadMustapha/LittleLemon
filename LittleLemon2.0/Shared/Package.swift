// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package: Package = .init(
    name: "Shared",
    platforms: [.iOS],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Shared"),
        .testTarget(
            name: "SharedTests",
            dependencies: ["Shared"]),
    ]
)

fileprivate extension Product {

    static let sharedProduct: Product = .library(name: .shared,
                                               targets: [.shared])
}

fileprivate extension String {

    // MARK: Folders
    static let shared: String = "Shared"

    var testTarget: String { "\(self)Tests" }
}

fileprivate extension SupportedPlatform {

    static let iOS: SupportedPlatform = .iOS(.v16)
}

fileprivate extension Target {

    static let sharedTarget: Target = target(name: .shared)

    static let sharedTestTarget: Target = testTarget(name: .shared.testTarget,
                                                     dependencies: [.sharedDependency])
}

fileprivate extension Target.Dependency {

    static let sharedDependency: Target.Dependency = byName(name: .shared)
}
