// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package: Package = .init(
    name: "Network",
    platforms: [.iOS],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Network",
            targets: ["Network"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Network"),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network"]),
    ]
)

fileprivate extension Product {

    static let networkProduct: Product = .library(name: .network,
                                               targets: [.network])
}

fileprivate extension String {

    // MARK: Folders
    static let network: String = "Network"

    var testTarget: String { "\(self)Tests" }
}

fileprivate extension SupportedPlatform {

    static let iOS: SupportedPlatform = .iOS(.v16)
}

fileprivate extension Target {

    static let networkTarget: Target = target(name: .network)
    static let networkTestTarget: Target = testTarget(name: .network.testTarget,
                                                   dependencies: [.networkDependency])
}

fileprivate extension Target.Dependency {

    static let networkDependency: Target.Dependency = byName(name: .network)
}
