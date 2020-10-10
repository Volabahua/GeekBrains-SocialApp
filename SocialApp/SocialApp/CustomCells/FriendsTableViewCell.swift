//
//  FriendsTableViewCell.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 06.10.2020.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
