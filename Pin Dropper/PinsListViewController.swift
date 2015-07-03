//
//  PinsListViewController.swift
//  Pin Dropper
//
//  Created by Talha Babar on 7/2/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//


class PinsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var pinsArray : [Pin]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        println(pinsArray.count)
        return pinsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
            let cell = tableView.dequeueReusableCellWithIdentifier(CustomCell.cellIdentifier, forIndexPath: indexPath) as! CustomCell
            cell.pinNumberLabel.text = "\(indexPath.row)."
            cell.addressLabel.text = "Address: \(pinsArray[indexPath.row].address)"
            cell.addressLabel.font.fontWithSize(12.0)
            cell.latitudeLabel.text = "Latitude: \(pinsArray[indexPath.row].latitude)"
            cell.longitudeLabel.text = "Longitude: \(pinsArray[indexPath.row].longitude)"
            return cell
            
        }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "List of Pins"
        }

}
