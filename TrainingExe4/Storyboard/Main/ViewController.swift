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
    
    var data = [AvResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        data.append(AvResult())
        data.append(AvResult())
        data.append(AvResult())
        data.append(AvResult())
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(data[indexPath.row].captureDate)"
        return cell
    }

}

