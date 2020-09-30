//
//  TweetCellTableCellTableViewCell.swift
//  Twitter
//
//  Created by Jonathan Leibovici on 9/29/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
