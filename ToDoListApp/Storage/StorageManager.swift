//
//  StorageManager.swift
//  ToDoListApp
//
//  Created by Robert Miller on 03.09.2021.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    private let userDefaults = UserDefaults.standard
    private let deedKey = "deed"
    
    private init() { }
    
    func save(deed: Deed) {
        var toDoList = fetchToDoList()
        toDoList.append(deed)
        guard let data = try? JSONEncoder().encode(toDoList) else { return }
        userDefaults.set(data, forKey: deedKey)
    }
    
    func fetchToDoList() -> [Deed] {
        guard let data = userDefaults.object(forKey: deedKey) as? Data else {
            return []
        }
        guard let toDoList = try? JSONDecoder().decode([Deed].self, from: data) else { return [] }
    
        return toDoList
    }
    
    func deleteDeed(at index: Int) {
        var toDoList = fetchToDoList()
        toDoList.remove(at: index)
        
        guard let data = try? JSONEncoder().encode(toDoList) else { return }
        userDefaults.set(data, forKey: deedKey)
    }
    
}
