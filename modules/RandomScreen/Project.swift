import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.RandomScreen.rawValue,
    targets: [
        .feature(
            interface: .RandomScreen,
            dependencies: [
                .common
            ]
        ),
        .feature(
            implementation: .RandomScreen,
            dependencies: [
                .common,
                .feature(interface: .RandomScreen),
                .feature(interface: .RandomProvider),
            ]
        )
    ]
)
