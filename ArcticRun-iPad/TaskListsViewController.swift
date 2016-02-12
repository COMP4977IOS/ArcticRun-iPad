//
//  TaskListsController.swift
//  ArcticRun-iPad
//
//  Created by Kevin Chow Gonzalez on 2016-02-12.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import UIKit

class TaskListsViewController : UITableViewController {
    let monthsDataSet = ["January", "February", "March", "April", "May", "June"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthsDataSet.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Basic")!
        
        cell.textLabel?.text = monthsDataSet[indexPath.row]
        return cell
    }
}