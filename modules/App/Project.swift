import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.App.rawValue,
    targets: [
        .makeApp(
            name: "ExampleApp",
            sources: [
                "src/**"
            ],
            dependencies: [
                .common,
                .feature(implementation: .RandomProvider),
                .feature(interface: .RandomProvider),
                
                .feature(implementation: .RandomScreen),
                .feature(interface: .RandomScreen)
            ]
        )
    ]
)
