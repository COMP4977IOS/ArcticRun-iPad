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
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

