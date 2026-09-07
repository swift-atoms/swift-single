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
        .library(name: "Single", targets: ["Single"]),
        .library(name: "Single Standard Library Integration", targets: ["Single Standard Library Integration"]),
        .library(name: "Single Foundation Library Integration", targets: ["Single Foundation Library Integration"]),
        .library(name: "Single Test Support", targets: ["Single Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Single",
            dependencies: [
            ],
            path: "Sources/Single"
        ),
        .target(
            name: "Single Standard Library Integration",
            dependencies: [
                .target(name: "Single"),
            ],
            path: "Sources/Single Standard Library Integration"
        ),
        .target(
            name: "Single Foundation Library Integration",
            dependencies: [
                .target(name: "Single"),
                .target(name: "Single Standard Library Integration"),
            ],
            path: "Sources/Single Foundation Library Integration"
        ),
        .target(
            name: "Single Test Support",
            dependencies: [
                .target(name: "Single"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Single Tests",
            dependencies: [
                .target(name: "Single"),
                .target(name: "Single Test Support"),
                .target(name: "Single Standard Library Integration"),
                .target(name: "Single Foundation Library Integration"),
            ],
            path: "Tests/Single Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
