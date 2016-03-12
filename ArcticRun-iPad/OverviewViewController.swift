//
//  FirstViewController.swift
//  ArcticRun-iPad
//
//  Created by Jacky Lui on 2016-02-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import UIKit
import KDCircularProgress
import GameKit
class OverviewViewController: UIViewController, GKGameCenterControllerDelegate {
    
    @IBOutlet weak var stepCount: UILabel!
    var progress: KDCircularProgress!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progress = KDCircularProgress(frame: CGRect(x:0,y:0, width:200, height:200))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.center = view.center
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = true
        progress.glowMode = .NoGlow
        progress.angle = 1
        progress.setColors(UIColor.cyanColor())
        
        view.addSubview(progress)
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Load gamecenter stuff
        let localPlayer = GKLocalPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            if (viewController != nil) {
                self.presentViewController(viewController!, animated: true, completion: nil)
            } else {
                print((GKLocalPlayer().authenticated))
            }
            
        }
    }
    //Button to animate progress bar
    @IBAction func showProgress(sender: UIButton) {
        let value:Int! = Int(stepCount.text!)
        progress.animateFromAngle(0, toAngle:value, duration:5){ completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        
        //code to dismiss your gameCenterViewController
        
        // for example:
        
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }

}

