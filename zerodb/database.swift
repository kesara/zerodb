//
//  database.swift
//  ZeroDB Database class
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

class Database {
    // data dictionary
    var data: [String: [String?]]
    
    init() {
        self.data = [String: [String?]]()
    }

    func insert(key: String, values: [String]) {
        /* Insert function:
         *      Insert key, value to the database
         *      Parameters:
         *          key: key
         *          values: values as an array
         */
        self.data[key] = values
    }

    func select(key: String) -> [String?]? {
        /*  Select function:
         *      Return values array for given key
         *      Parameters:
         *          key: key
         *      Return:
         *          Values for given key, nil if key is missing.
         */
        return self.data[key]
    }

    func delete(key: String) {
        /* Delete function:
         *      Delete record for given key
         *      Parameters:
         *          key: key
         */
        self.data.removeValue(forKey: key)
    }
}
