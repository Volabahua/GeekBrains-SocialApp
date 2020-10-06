//
//  FriendsTableViewController.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 02.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    let friendsArray: [Friend] = [
        Friend(name: "Charlie Scene", age: 35, photo: "charlie scene"),
        Friend(name: "Danny", age: 37, photo: "danny"),
        Friend(name: "Funny Man", age: 34, photo: "funny man"),
        Friend(name: "J-Dog", age: 36, photo: "j-dog"),
        Friend(name: "Johnny 3 Tears", age: 39, photo: "johnny 3 tears")]
    
    //Количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Количество строк в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }

    //Инициализация таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Используем собственную ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell") as! FriendsTableViewCell
        
        //Передаем данные в ячейку
        cell.friendPhoto.image = UIImage(named: friendsArray[indexPath.row].photo)
        cell.nameLabel.text = friendsArray[indexPath.row].name
        cell.ageLabel.text = String(friendsArray[indexPath.row].age)
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let destination = segue.destination as? PhotosCollectionViewController else { return }

        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedPhoto = friendsArray[indexPath.row]
            destination.photosArray.append(selectedPhoto.photo)
            destination.photosArray.append(selectedPhoto.photo + "2")
            destination.photosArray.append(selectedPhoto.photo + "3")
            }

    }
    

}
