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
    }

    // MARK: - Table view data source
    
    let friendsArray: [Friend] = [
        Friend(friendName: "Charlie Scene", friendAge: 35, friendPhoto: UIImage(named: "charlie scene")! ),
        Friend(friendName: "Danny", friendAge: 37, friendPhoto: UIImage(named: "danny")! ),
        Friend(friendName: "Funny Man", friendAge: 34, friendPhoto: UIImage(named: "funny man")! ),
        Friend(friendName: "J-Dog", friendAge: 36, friendPhoto: UIImage(named: "j-dog")! ),
        Friend(friendName: "Johnny 3 Tears", friendAge: 39, friendPhoto: UIImage(named: "johnny 3 tears")! )]
    
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
        cell.friendPhoto.image = friendsArray[indexPath.row].friendPhoto
        cell.nameLabel.text = friendsArray[indexPath.row].friendName
        cell.ageLabel.text = String(friendsArray[indexPath.row].friendAge)
        
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
            destination.photosArray.append(selectedPhoto.friendPhoto)
            }
    }
    
}
