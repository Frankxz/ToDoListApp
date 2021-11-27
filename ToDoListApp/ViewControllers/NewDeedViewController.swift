//
//  NewDeedViewController.swift
//  ToDoListApp
//
//  Created by Robert Miller on 03.09.2021.
//

import UIKit

class NewDeedViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var decsriptionTextField:
        UITextField!
    
    var delegate: SaveTaskDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveAction() {
        let task = Task(titl: titleTextField.text ?? " ", descript: decsriptionTextField.text ?? "" )
        delegate.saveTask(for: task)
        dismiss(animated: true)
    }
    

}
