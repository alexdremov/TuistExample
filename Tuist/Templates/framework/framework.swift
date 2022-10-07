import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")


let template = Template(
    description: "Framework template",
    attributes: [
        nameAttribute
    ], items: [
        .file(
            path: "modules/\(nameAttribute)/Project.swift",
            templatePath: "project.stencil"
        ),
        .string(path: "modules/\(nameAttribute)/src/implementation.swift", contents: "// Module \(nameAttribute)\nimport Foundation"),
        .string(path: "modules/\(nameAttribute)/interface/interface.swift", contents: "// Module \(nameAttribute)\nimport Foundation")
    ]
)
