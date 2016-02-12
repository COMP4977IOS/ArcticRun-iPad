//
//  TaskViewController.swift
//  ArcticRun-iPad
//
//  Created by Kevin Chow Gonzalez on 2016-02-12.
//  Copyright © 2016 COMP 4977. All rights reserved.
//


import Foundation
import UIKit

class TaskViewController : UITableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Basic")!
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
}