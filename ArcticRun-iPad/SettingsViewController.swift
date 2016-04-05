//
//  SettingsViewController.swift
//  ArcticRun-iPad
//
//  Created by Aicha Hezit on 2016-02-15.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import UIKit
import KDCircularProgress
class SettingsViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var distUnit: UISwitch!
    var userDefaults: NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.valueForKey("settingsDistanceUnit") as? String == "M" {
            distUnit.setOn(true, animated: false)
        } else {
            distUnit.setOn(false, animated: false)
        }
    }
    
    @IBAction func distUnitChange(sender: AnyObject) {
        if distUnit.on {
            userDefaults.setValue("M", forKey: "settingsDistanceUnit")
            print("M")
        } else {
            userDefaults.setValue("K", forKey: "settingsDistanceUnit")
            print("K")
        }
        userDefaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

