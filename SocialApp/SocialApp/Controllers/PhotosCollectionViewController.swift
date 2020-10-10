//
//  PhotosCollectionViewController.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 02.10.2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var photosArray = [UIImage]()

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as! FriendsCollectionViewCell
    
        cell.imageViewPhoto.image = photosArray[indexPath.row]
        
        return cell
    }

}
