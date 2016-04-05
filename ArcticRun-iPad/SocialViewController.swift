//
//  SocialViewController.swift
//  ArcticRun-iPad
//
//  Created by Anson Ciurcovich on 2016-02-09.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import UIKit
import GameKit

class SocialViewController: UIViewController, GKGameCenterControllerDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var test: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let unit = userDefaults.valueForKey("settingsDistanceUnit")
        test.text = unit as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func authenticateLocalPlayer(sender: AnyObject) {
        let localPlayer = GKLocalPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            if (viewController != nil) {
                self.presentViewController(viewController!, animated: true, completion: nil)
            } else {
                print((GKLocalPlayer().authenticated))
            }
            
        }
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        
        //code to dismiss your gameCenterViewController
        
        // for example:
        
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}