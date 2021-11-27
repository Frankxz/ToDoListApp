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
    private let taskKey = "task"
    
    private init() { }
    
    func save(task: Task) {
        var toDoList = fetchToDoList()
        toDoList.append(task)
        guard let data = try? JSONEncoder().encode(toDoList) else { return }
        userDefaults.set(data, forKey: taskKey)
    }
    
    func fetchToDoList() -> [Task] {
        guard let data = userDefaults.object(forKey: taskKey) as? Data else {
            return []
        }
        guard let toDoList = try? JSONDecoder().decode([Task].self, from: data) else { return [] }
    
        return toDoList
    }
    
    func deleteTask(at index: Int) {
        var toDoList = fetchToDoList()
        toDoList.remove(at: index)
        
        guard let data = try? JSONEncoder().encode(toDoList) else { return }
        userDefaults.set(data, forKey: taskKey)
    }
    
}
