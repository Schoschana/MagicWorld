//
//  TasksViewController.swift
//  TheMagicTheWorldTheYou
//
//  Created by Lili on 05/09/2019.
//  Copyright © 2019 Lily. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = "This is cell number \(indexPath.row)"
        cell.textLabel?.textColor = .white
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
   
    }
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
    }
    @IBAction func signOutTapped(_)
}
