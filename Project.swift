import ProjectDescription

let project = Project(
    name: "Personal_Finance",
    packages: [
        .remote(url: "https://github.com/groue/GRDB.swift", requirement: .exact("7.6.1"))
    ],
    targets: [
        .target(
            name: "Personal Finance",
            destinations: .macOS,
            product: .app,
            bundleId: "jbkiv.Personal-Finance",
            sources: [
                "Personal_Finance/**"
            ],
            resources: [
                "Personal_Finance/**/*.xcassets"
            ],
            dependencies: [
                .package(product: "GRDB")
            ]
        ),
        .target(
            name: "Personal Finance DEBUG",
            destinations: .macOS,
            product: .app,
            bundleId: "jbkiv.Personal-Finance.debug",
            sources: [
                "Personal_Finance/**"
            ],
            resources: [
                "Personal_Finance/**/*.xcassets"
            ],
            dependencies: [
                .package(product: "GRDB")
            ],
            settings: .settings(
                configurations: [
                    .debug(name: "Debug")
                ]
            )
        )
    ]
)
