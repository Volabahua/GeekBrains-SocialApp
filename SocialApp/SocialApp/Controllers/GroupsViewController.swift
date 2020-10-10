//
//  GroupsViewController.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 02.10.2020.
//

import UIKit

class GroupsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    var userGroupsArray: [Group] = [
        Group(groupName: "Hollywood Undead", groupImage: UIImage(named: "hu-group")!),
        Group(groupName: "Friendship is magic", groupImage: UIImage(named: "mlp-group")!)
    ]
    
    private func addGroup(addedGroup: Group) -> [Group] {
        let array = userGroupsArray
        userGroupsArray.append(addedGroup)
        return array

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userGroupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupsTableViewCell

        cell.groupLabel.text = userGroupsArray[indexPath.row].groupName
        cell.groupImage.image =  userGroupsArray[indexPath.row].groupImage
        
        return cell
    }

    @IBAction func addGroup(segue: UIStoryboardSegue) {
            if segue.identifier == "addGroup" {
                guard let destination = segue.source as? AllGroupsTableViewController else { return }
                if let indexPath = destination.tableView.indexPathForSelectedRow {
                    let group = destination.allGroupsArray[indexPath.row]
                    userGroupsArray.append(group)
                    tableView.reloadData()
                }
            }
        }

    
}
