//
//  PinsListViewController.swift
//  Pin Dropper
//
//  Created by Talha Babar on 7/2/15.
//  Copyright (c) 2015 Talha Babar. All rights reserved.
//


class PinsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var passed : [Pin]!
    var cellIdentifier = CustomCell.cellIdentifier
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        println(passed.count)
        return passed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomCell
            cell.pinNumberLabel.text = "\(indexPath.row)"
            cell.addressLabel.text = "Address: \(passed[indexPath.row].address)"
            cell.coordinatesLabel.text = "Latitude: \(passed[indexPath.row].latitude) Longitude: \(passed[indexPath.row].longitude)"
            cell.coordinatesLabel.font.fontWithSize(7.0)
            return cell
            
        }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "List of Pins"
        }

}
