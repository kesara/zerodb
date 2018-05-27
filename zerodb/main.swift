//
//  main.swift
//  zerodb
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

printWelcome()

var databse = Database()

while (true) {
    printPrompt()
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
            databse.delete(name: userInputArray[1])
        }
    }
}

