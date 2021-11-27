//
//  Deed.swift
//  ToDoListApp
//
//  Created by Robert Miller on 03.09.2021.
//

import Foundation

class Task: Codable {
    let title: String
    let desctiption: String
    

    init(titl: String, descript: String) {
        title = titl
        desctiption = descript
    }
}
