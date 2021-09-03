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
    
    var delegate: SaveDeedDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveAction() {
        print("HERE")
        let deed = Deed(titl: titleTextField.text ?? " ", descript: decsriptionTextField.text ?? "" )
        delegate.saveDeed(for: deed)
        dismiss(animated: true)
    }
    

}
