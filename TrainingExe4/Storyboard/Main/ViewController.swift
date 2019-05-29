//
//  ViewController.swift
//  TrainingExe4
//
//  Created by NamTQ-D3 on 5/28/19.
//  Copyright © 2019 NamTQ-D3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnChangeEditMode: UIButton!
    @IBOutlet weak var btnChangeMovementMode: UIButton!
    
    var data = [AvResult]()
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load data
        let queue = DispatchQueue.main
        let addAction = {() -> Void in
            self.data.append(AvResult())
            self.tableView.reloadData()
        }
        data.append(AvResult())
        queue.asyncAfter(deadline: .now() + 0.5, execute: addAction)
        queue.asyncAfter(deadline: .now() + 1, execute: addAction)
        queue.asyncAfter(deadline: .now() + 1.5, execute: addAction)
        //
        
        tableView.isEditing = false
    }
    
    // MARK: IBAction
    
    @IBAction func switchEditMode(_ sender: UIButton) {
        isEditMode = !isEditMode
        
        if (isEditMode) {
            btnChangeEditMode.setText(text: "Done")
        } else {
            btnChangeEditMode.setText(text: "Edit")
        }
        
        tableView.reloadData()
    }
    
    @IBAction func switchMoveMode(_ sender: UIButton) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if (tableView.isEditing) {
            btnChangeMovementMode.setText(text: "Done")
        } else {
            btnChangeMovementMode.setText(text: "Move")
        }
    }
    //
    
    //MARK: TableView function
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        cell.label.text = "\(data[indexPath.row].captureDate)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (tableView.isEditing) {
            return true
        }
        
        return isEditMode
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Add swipe action
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action
            , indexPath) in
            self.data.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveData = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(moveData, at: destinationIndexPath.row)
    }
    //
}

