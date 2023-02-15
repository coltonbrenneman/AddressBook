//
//  GrouplistTableViewController.swift
//  AddressBook
//
//  Created by Colton Brenneman on 2/13/23.
//

import UIKit

class GrouplistTableViewController: UITableViewController {


    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroupController.sharedInstance.groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)

        
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let groupToBeDeleted = GroupController.sharedInstance.groups[indexPath.row]
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }    
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPerson"{
            if let indexPath = tableView.indexPathForSelectedRow,
               let destinationVC = segue.destination as? PersonListTableViewController{
                let groupToSend = GroupController.sharedInstance.groups[indexPath.row]
                destinationVC.group = groupToSend
            }
        }
    }
}
