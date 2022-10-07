//
//  Project+InfoPlist.swift
//  ProjectDescriptionHelpers
//
//  Created by Alex Dremov on 23.08.2022.
//

import ProjectDescription

public let infoPlistExtension: [_: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "",
    "NSHealthShareUsageDescription":
            .string("Your health and workout records will be used localy for visualizing and analyzing your data"),
    "NSHealthUpdateUsageDescription":
            .string("Your health and workout records will be used localy for visualizing and analyzing your data"),
    "NSHealthRecordsUsageDescription":
            .string("Your health and workout records will be used localy for visualizing and analyzing your data")
]
