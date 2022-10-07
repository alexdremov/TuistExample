import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: Feature.Common.rawValue,
    targets: [
        .feature(
            implementation: .Common
        )
    ]
)
