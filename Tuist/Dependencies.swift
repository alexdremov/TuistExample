import ProjectDescription
import ProjectDescriptionHelpers

let spmDeps = SwiftPackageManagerDependencies(
    [
        .remote(url: "https://github.com/AlexRoar/FoggyColors",
                requirement: .branch("main")),
        .remote(url: "https://github.com/apple/swift-async-algorithms",
                requirement: .branch("main"))
    ],
    productTypes: [
        "FoggyColors": ProjectDescriptionHelpers.defaultPackageType,
        "AsyncAlgorithms": ProjectDescriptionHelpers.defaultPackageType
    ]
)

let dependencies = Dependencies(
    swiftPackageManager: spmDeps,
    platforms: [
        .iOS
    ]
)
