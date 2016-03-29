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
import CloudKit

class OverviewViewController: UIViewController, GKGameCenterControllerDelegate {
    static var dirty = true
    var goals = [Goal]()
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if OverviewViewController.dirty {
            grabCloudKitData()
            print("grabbing cloud kit goals")
        }
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        //code to dismiss your gameCenterViewController
        // for example:
        
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
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
    
    func grabCloudKitData() {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: "Goal", predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["caloriesBurnedDaily", "distanceKilometersDaily", "minutesDaily", "stepsDaily"]
        operation.resultsLimit = 50
        
        var newGoals = [Goal]()
        
        operation.recordFetchedBlock = { (record) in
            let goal = Goal()
            goal.recordID = record.recordID
            goal.calories = record["caloriesBurnedDaily"] as! Double
            goal.distance = record["distanceKilometersDaily"] as! Double
            goal.minutes = record["minutesDaily"] as! Double
            goal.steps = record["stepsDaily"] as! Double
            newGoals.append(goal)
        }
        
        operation.queryCompletionBlock = { [unowned self] (cursor, error) in
            dispatch_async(dispatch_get_main_queue()) {
                if error == nil {
                    OverviewViewController.dirty = false
                    self.goals = newGoals
                } else {
                    let ac = UIAlertController(title: "Fetch failed", message: "There was a problem fetching the data from cloudkit; please try again: \(error!.localizedDescription)", preferredStyle: .Alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    self.presentViewController(ac, animated: true, completion: nil)
                }
            }
        }
        CKContainer.defaultContainer().publicCloudDatabase.addOperation(operation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

