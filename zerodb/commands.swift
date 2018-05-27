//
//  commands.swift
//  zerodb
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

enum Commands: String {
    case quit = "quit"
    case help = "help"
    case version = "version"
    case insert = "insert"
    case select = "select"
    case delete = "delete"
}

extension Commands {
    func description() -> String {
        switch self {
        case .quit:
            return "Quit"
        case .help:
            return "Help"
        case .version:
            return "Version"
        case .insert:
            return "Insert query"
        case .select:
            return "Select query"
        case .delete:
            return "Delete query"
        }
    }
}

extension Bundle {
    var releaseVersion: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersion: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

func showHelp() {
    let commands = [Commands.quit, Commands.help, Commands.version, Commands.insert, Commands.select, Commands.delete]
    for command in commands {
        print("\(command)\t\(command.description())")
    }
}

func showVersion() {
    let noTerminator = ""
    print("ZeroDB", terminator: noTerminator)
    if let releaseVersion = Bundle.main.releaseVersion {
        print(releaseVersion, terminator:noTerminator)
    }
    if let buildVersion = Bundle.main.buildVersion {
        print(buildVersion, terminator:noTerminator)
    }
    print("")
}

func printWelcome() {
    print("""
        0000000000
        0 ZeroDB 0
        0000000000
        """)
}

func printPrompt() {
    let prompt = "0"
    let terminator = ">"
    print(prompt, terminator: terminator)
}