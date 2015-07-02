//
//  CustomCell.swift
//  Pin Dropper
//
//  Created by Talha Babar on 7/2/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let cellIdentifier = "CustomCellIdentifier"
    
    @IBOutlet weak var pinNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
