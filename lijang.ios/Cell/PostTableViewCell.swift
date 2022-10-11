//
//  PostTableViewCell.swift
//  lijang.ios
//
//  Created by Kyle Gavin on 10/11/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var photoLabel: UIImageView!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
