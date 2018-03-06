//
//  CustomCell.swift
//  iOS_VotingApp
//
//  Created by 小池基文 on 2018/03/04.
//  Copyright © 2018年 iOS_Training_day3_2. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
