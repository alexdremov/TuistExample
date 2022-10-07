import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.RandomProvider.rawValue,
    targets: [
        .feature(
            interface: .RandomProvider,
            dependencies: [
                .common
            ]
        ),
        .feature(
            implementation: .RandomProvider,
            dependencies: [
                .common,
                .feature(interface: .RandomProvider),
            ]
        )
    ]
)
