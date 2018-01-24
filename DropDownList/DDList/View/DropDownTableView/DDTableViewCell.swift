//
//  DDTableViewCell.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

class DDTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if self.accessoryType == .checkmark {
                self.accessoryType = .none
            } else {
                self.accessoryType = .checkmark
            }
            
        } else {
            self.accessoryType = .none
        }
        // Configure the view for the selected state
    }

}
