import ProjectDescription

let project = Project(
    name: "MyApp",
    targets: [
        .target(
            name: "PeronalFinance",
            destinations: .macOS,
            product: .app,
            bundleId: "jbkiv.Personal-Finance",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["PersonalFinance/**"],
            resources: ["PersonalFinance/**"],
            dependencies: []
        )
    ]
)