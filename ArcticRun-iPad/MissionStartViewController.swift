//
//  MissionStartViewController.swift
//  ArcticRun-iPad
//
//  Created by Sam Salvail on 2016-04-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import UIKit

class MissionStartViewController : UIViewController, UIViewControllerTransitioningDelegate{
    
    var toPass : String!
    
    @IBOutlet weak var missionText: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var missionPic: UIImageView!
    @IBOutlet weak var missionSynop: UITextView!
    
    override func viewDidLoad() {
        
            super.viewDidLoad()
        
        loadMission()
        loadBG()
        
        // Label will display whatever is selected
        missionText.font = UIFont(name:"Noteworthy", size: 48)
        missionText.text = toPass
        
        
        //TextView
        missionSynop.editable = false
        
        
        
        
        if (self.revealViewController() != nil) {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    func loadMission() {
        
        
        if(toPass == "Scott Hut") {
            
            missionPic.image = UIImage(named: "Reconnaissance")
            missionSynop.text = "Yourself, Joyce, and Richards have been tasked to travel to Scott Hut and assess its potential as a base of operations. After being confined to the ship for weeks, this will be a welcome change."
            missionSynop.font = UIFont(name: "Noteworthy", size: 28)
            
            
        }else if(toPass == "The Ship") {
            
            missionPic.image = UIImage(named: "OldWoodenShip")
            missionSynop.text = "After discovering Scott Hut in good condtion, travel back to the ship and inform the expedtion of your findings."
            missionSynop.font = UIFont(name: "Noteworthy", size: 28)
            
        }else{}
        
    }
    
    func loadBG() {
        
        // Gradient Background color
        let background = CAGradientLayer().blueblendColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
    }

    
}
