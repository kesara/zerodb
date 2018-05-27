//
//  database.swift
//  zerodb
//
//  Created by Kesara Rathnayake on 27/05/18.
//  Copyright © 2018 Kesara Rathnayake. All rights reserved.
//

import Foundation

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
