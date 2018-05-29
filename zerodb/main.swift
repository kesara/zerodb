//
//  main.swift
//  ZeroDB
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

printWelcome()

var databse = Database()

while (true) {
    // REPL

    printPrompt()
    // read user input
    let rawInput = readLine()
    
    if var userInput = rawInput {
        // strip leading/trailing whitespace from user input
        userInput = userInput.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if userInput.count == 0 {
            // no command start the loop again
            continue
        }
        
        // split the user input
        let userInputArray = userInput.components(separatedBy: " ")
        // identify the command
        guard let input = Commands(rawValue: userInputArray[0]) else {
            // invalid command, restart the loop
            print("Invalid command!")
            continue
        }
        // count input labels
        let label_count = userInputArray.count - 1

        switch input {
        case Commands.quit:
            // quit program
            exit(0)
        case Commands.help:
            // show help
            if label_count == 1 {
                // show help for given command
                guard let command_label = Commands(rawValue: userInputArray[1]) else {
                    // invalid command, show full command help
                    showHelp()
                    continue
                }
                printHelp(command_label)
                continue
            }
            showHelp()
        case Commands.version:
            // print version information
            showVersion()
        case Commands.insert:
            // insert command
            if label_count < 1 {
                // no key is provided
                printError("No key is provided.", command: input)
                continue
            }
            databse.insert(key: userInputArray[1], values: Array(userInputArray[2..<userInputArray.count]))
        case Commands.select:
            // select command
            if label_count == 0 {
                // no key is provided
                printError("No key is provided.", command: input)
                continue
            } else if label_count > 1 {
                // multile values for key
                printError("Multiple keys provided.", command: input)
                continue
            }
            if let values = databse.select(key: userInputArray[1]) {
                // print the values
                print(values)
            } else {
                // can not find the key, print nothing
                continue
            }
        case Commands.delete:
            // delete command
            if label_count == 0 {
                // no key is provided
                printError("No key is provided.", command: input)
                continue
            } else if label_count > 1 {
                // multile values for key
                printError("Multiple keys provided.", command: input)
                continue
            }
            databse.delete(key: userInputArray[1])
        }
    }
}

