//
//  GroupsTableViewCell.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 06.10.2020.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
