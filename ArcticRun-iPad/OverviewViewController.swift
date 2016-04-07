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
    var goals = [Goal]?()
    var circles = [KDCircularProgress]()
    
    @IBOutlet weak var stepCount: UILabel!
    @IBOutlet weak var caloriesCount: UILabel!
    @IBOutlet weak var distanceCount: UILabel!
    @IBOutlet weak var minutesCount: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var circlestackview: UIStackView!
    
    @IBOutlet weak var CaloriesCircle: KDCircularProgress!
    @IBOutlet weak var StepsCircle: KDCircularProgress!
    @IBOutlet weak var DistanceCircle: KDCircularProgress!
    @IBOutlet weak var MilesCircle: KDCircularProgress!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        }
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        //code to dismiss your gameCenterViewController
        // for example:
        
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Button to animate progress bar
    @IBAction func showProgress(sender: UIButton) {
        if let goal = goals?[0] //grab first one for now
        {
            self.caloriesCount.text = String(goal.calories);
            
            CaloriesCircle.animateFromAngle(0, toAngle:goal.calories, duration:5){ completed in
                if completed {
                    print("animation stopped, completed")
                } else {
                    print("animation stopped, was interrupted")
                }
            }
            
            self.distanceCount.text = String(goal.distance);
            DistanceCircle.animateFromAngle(0, toAngle:goal.distance, duration:5){ completed in
                if completed {
                    print("animation stopped, completed")
                } else {
                    print("animation stopped, was interrupted")
                }
            }
            
            self.minutesCount.text = String(goal.minutes);
            MilesCircle.animateFromAngle(0, toAngle:goal.minutes, duration:5){ completed in
                if completed {
                    print("animation stopped, completed")
                } else {
                    print("animation stopped, was interrupted")
                }
            }
            
            self.stepCount.text = String(goal.steps);
            StepsCircle.animateFromAngle(0, toAngle:goal.steps, duration:5){ completed in
                if completed {
                    print("animation stopped, completed")
                } else {
                    print("animation stopped, was interrupted")
                }
            }
        }
        else {
            print("goals empty")
        }
    }
    
    func grabCloudKitData() {
        CKContainer.defaultContainer().accountStatusWithCompletionHandler()
        {
            (status: CKAccountStatus, error: NSError?) in
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
                    goal.calories = record["caloriesBurnedDaily"] as! Int
                    goal.distance = record["distanceKilometersDaily"] as! Int
                    goal.minutes = record["minutesDaily"] as! Int
                    goal.steps = record["stepsDaily"] as! Int
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

