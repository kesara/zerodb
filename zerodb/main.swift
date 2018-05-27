//
//  main.swift
//  zerodb
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

print("""
0000000000
0 ZeroDB 0
0000000000
""")

let prompt = "0"
let terminator = ">"

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

class Database {
    var data: [String: [String?]]
    
    init() {
        self.data = [String: [String?]]()
    }
    
    func insert(name: String, values: [String]) {
        self.data[name] = values
    }
    
    func select(name: String) -> [String?]? {
        return self.data[name]
    }
}

var databse = Database()

while (true) {
    print(prompt, terminator: terminator)
    let rawInput = readLine()
    
    if let userInput = rawInput {
        if userInput.count == 0 {
            continue
        }
        
        let userInputArray = userInput.components(separatedBy: " ")
        guard let input = Commands(rawValue: userInputArray[0]) else {
            print("Invalid command!")
            continue
        }
        switch input {
        case Commands.quit:
            exit(0)
        case Commands.help:
            showHelp()
        case Commands.version:
            showVersion()
        case Commands.insert:
            databse.insert(name: userInputArray[1], values: Array(userInputArray[2..<userInputArray.count]))
        case Commands.select:
            if let values = databse.select(name: userInputArray[1]) {
                print(values)
            } else {
                continue
            }
        case Commands.delete:
            print(input.description())
        }
    }
}

