//
//  commands.swift
//  ZeroDB Commands class
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

enum Commands: String {
    // valid commands
    case quit = "quit"
    case help = "help"
    case version = "version"
    case insert = "insert"
    case select = "select"
    case delete = "delete"
}

extension Commands {
    // command descriptions
    func description() -> String {
        switch self {
        case .quit:
            return "Quit ZeroDB"
        case .help:
            return "Show help. help <command> for command specific help."
        case .version:
            return "Show ZeroDB version information"
        case .insert:
            return "insert <key> <value_1> <value_2> ... <value_n>"
        case .select:
            return "select <key>"
        case .delete:
            return "delete <key>"
        }
    }
}

extension Bundle {
    // release version
    var releaseVersion: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    // bundle version
    var buildVersion: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

func showHelp() {
    /* Show help */
    let commands = [Commands.quit, Commands.help, Commands.version, Commands.insert, Commands.select, Commands.delete]
    for command in commands {
        printHelp(command)
    }
}

func showVersion() {
    /* Show version */
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
    /* Print welcome */
    print("""
        0000000000
        0 ZeroDB 0
        0000000000
        """)
}

func printPrompt() {
    /* Print REPL prompt */
    let prompt = "0"
    let terminator = ">"
    print(prompt, terminator: terminator)
}

func printError(_ message: String, command: Commands?) {
    /* Print error function:
     *      Print given error message and command usage if command is provided
     *      Paramertes:
     *          message: error message
     *          command: command (optional)
     */
    print("Error: \(message)")
    if let givenCommand = command {
        print("Usage: \(givenCommand.description())")
    }
}

func printHelp(_ command: Commands) {
    /* Print help function:
     *      Print help for given command
     *      Parameters:
     *          command: command
     */
    print("\(command):\t\(command.description())")
}
