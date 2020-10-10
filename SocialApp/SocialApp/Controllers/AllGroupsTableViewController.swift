//
//  AllGroupsTableViewController.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 02.10.2020.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    var allGroupsArray: [Group] = [
        Group(groupName: "Liza the Great", groupImage: UIImage(named: "liza-group")!),
        Group(groupName: "Tea maniacs", groupImage: UIImage(named: "tea-group")!)
    ]


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroupsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupsTableViewCell

        cell.groupLabel.text = allGroupsArray[indexPath.row].groupName
        cell.groupImage.image =  allGroupsArray[indexPath.row].groupImage
        
        return cell
    }
    
}
