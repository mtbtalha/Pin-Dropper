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
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    func usePin (pin : Pin) {
        pinNumberLabel.text = "\(pin.pinNumber)."
        addressLabel.text = "Address: \(pin.address)"
        latitudeLabel.text = "Latitude: \(pin.latitude)"
        longitudeLabel.text = "Longitude: \(pin.longitude)"
    }
 
}
