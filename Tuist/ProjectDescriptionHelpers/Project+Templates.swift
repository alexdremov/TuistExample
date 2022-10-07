import ProjectDescription

private let rootPackagesName = "com.exampleproject."

private func makeBundleID(with addition: String) -> String {
    (rootPackagesName + addition).lowercased()
}

public extension Target {
    static func makeApp(
        name: String,
        sources: ProjectDescription.SourceFilesList,
        dependencies: [ProjectDescription.TargetDependency]
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: makeBundleID(with: "app"),
            deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlistExtension),
            sources: sources,
            dependencies: dependencies
        )
    }

    static func makeFramework(
        name: String,
        sources: ProjectDescription.SourceFilesList,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: defaultPackageType,
            bundleId: makeBundleID(with: name + ".framework"),
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
    }

    private static func feature(
        implementation featureName: String,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .makeFramework(
            name: featureName,
            sources: [ "src/**" ],
            dependencies: dependencies,
            resources: resources
        )
    }

    private static func feature(
        interface featureName: String,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .makeFramework(
            name: featureName + "Interface",
            sources: [ "interface/**" ],
            dependencies: dependencies,
            resources: resources
        )
    }

    static func feature(
        implementation featureName: Feature,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .feature(
            implementation: featureName.rawValue,
            dependencies: dependencies,
            resources: resources
        )
    }

    static func feature(
        interface featureName: Feature,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .feature(
            interface: featureName.rawValue,
            dependencies: dependencies,
            resources: resources
        )
    }
}
