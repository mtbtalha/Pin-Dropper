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
        return pinsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
            let cell = tableView.dequeueReusableCellWithIdentifier(CustomCell.cellIdentifier, forIndexPath: indexPath) as! CustomCell
        cell.usePin(pinsArray[indexPath.row],index: indexPath.row + 1)
            return cell
            
        }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "List of Pins"
        }

}
