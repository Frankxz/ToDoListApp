//
//  ToDoListTableViewController.swift
//  ToDoListApp
//
//  Created by Robert Miller on 03.09.2021.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var tasks: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = StorageManager.shared.fetchToDoList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newDeedVC = segue.destination as! NewDeedViewController
        newDeedVC.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row].title
        content.secondaryText = tasks[indexPath.row].desctiption
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            StorageManager.shared.deleteTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


protocol SaveTaskDelegate {
    func saveTask(for task: Task)
}

extension ToDoListTableViewController: SaveTaskDelegate {
    func saveTask(for task: Task) {
        tasks.append(task)
        StorageManager.shared.save(task: task)
        print("saved")
        tableView.reloadData()
    }
}

