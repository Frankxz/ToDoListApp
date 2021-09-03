//
//  ToDoListTableViewController.swift
//  ToDoListApp
//
//  Created by Robert Miller on 03.09.2021.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    var deeds: [Deed] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        deeds = StorageManager.shared.fetchToDoList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newDeedVC = segue.destination as! NewDeedViewController
        newDeedVC.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = deeds[indexPath.row].title
        content.secondaryText = deeds[indexPath.row].desctiption
        cell.contentConfiguration = content
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
           // StorageManager.shared.deleteContact(at: indexPath.row)
            deeds.remove(at: indexPath.row)
            StorageManager.shared.deleteDeed(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }


}

protocol SaveDeedDelegate {
    func saveDeed(for deed: Deed)
}

extension ToDoListTableViewController: SaveDeedDelegate {
    func saveDeed(for deed: Deed) {
        deeds.append(deed)
        StorageManager.shared.save(deed: deed)
        print("saved")
        tableView.reloadData()
    }
}

