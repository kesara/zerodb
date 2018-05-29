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
    
    if let userInput = rawInput {
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

        switch input {
        case Commands.quit:
            // quit program
            exit(0)
        case Commands.help:
            // show help
            showHelp()
        case Commands.version:
            // print version information
            showVersion()
        case Commands.insert:
            // insert command
            databse.insert(key: userInputArray[1], values: Array(userInputArray[2..<userInputArray.count]))
        case Commands.select:
            // select command
            if let values = databse.select(key: userInputArray[1]) {
                // print the values
                print(values)
            } else {
                // can not find the key, print nothing
                continue
            }
        case Commands.delete:
            // delete command
            databse.delete(key: userInputArray[1])
        }
    }
}

