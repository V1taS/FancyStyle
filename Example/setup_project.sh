#!/bin/bash

# 1. Создание файла Project.swift
cat <<EOL > Project.swift
import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Setup project

let project = Project(
  name: appName,
  organizationName: organizationName,
  options: .options(automaticSchemesOptions: .disabled),
  settings: projectBuildIOSSettings,
  targets: [
    Target(
      name: appName,
      platform: .iOS,
      product: .app,
      bundleId: "\(reverseOrganizationName).\(appName)",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
      infoPlist: getMainIOSInfoPlist(),
      sources: [
        "\(rootPath)/Sources/**/*",
      ],
      resources: [
        "\(rootPath)/Resources/**/*",
      ],
      scripts: [
        scriptSwiftLint
      ],
      dependencies: [
        .external(name: "FancyStyle"),
      ],
      settings: targetBuildIOSSettings
    )
  ],
  schemes: [mainIOSScheme]
)
EOL

# 2. Создание файла Workspace.swift
cat <<EOL > Workspace.swift
import ProjectDescription

let workspace = Workspace(
  name: "Example",
  projects: ["./**"],
  generationOptions: .options(autogeneratedWorkspaceSchemes: .disabled)
)
EOL

# 3. Вызов команды tuist fetch
tuist fetch

# 4. Вызов команды tuist generate
tuist generate
