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
    
    @IBOutlet weak var stepCount: UILabel!
    var progress: KDCircularProgress!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toggle the menu bar
        if self.revealViewController() != nil {
            self.revealViewController().revealToggleAnimated(true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

