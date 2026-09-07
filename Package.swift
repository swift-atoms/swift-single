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

        .library(name: "Single Foundation Integration", targets: ["Single Foundation Integration"]),
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
            name: "Single Foundation Integration",
            dependencies: [
                .target(name: "Single"),
            ],
            path: "Sources/Single Foundation Integration"
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
                .target(name: "Single Foundation Integration"),
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
