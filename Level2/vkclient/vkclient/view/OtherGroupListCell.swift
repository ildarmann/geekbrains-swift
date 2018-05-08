//
//  OtherGroupListCell.swift
//  vkclient
//
//  Created by Ильдар on 08.05.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import UIKit

class OtherGroupListCell: UITableViewCell {

    @IBOutlet var foto: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var memberCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
