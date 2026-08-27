// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-single",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Single",
            targets: ["Single"]
        ),
        .library(
            name: "Single Standard Library Integration",
            targets: ["Single Standard Library Integration"]
        ),
        .library(
            name: "Single Apple Foundation Integration",
            targets: ["Single Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Single",
            dependencies: []
        ),
        .target(
            name: "Single Standard Library Integration",
            dependencies: ["Single"]
        ),
        .target(
            name: "Single Apple Foundation Integration",
            dependencies: [
                "Single",
                "Single Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Single Tests",
            dependencies: ["Single"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
