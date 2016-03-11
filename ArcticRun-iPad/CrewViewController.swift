//
//  CrewViewController.swift
//  ArcticRun-iPad
//
//  Created by codie on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import UIKit

class CrewViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //UI components for Crew Member 1
    @IBOutlet weak var crewMember1: UIStackView!
    @IBOutlet weak var crewName1: UILabel!
    @IBOutlet weak var crewImage1: UIImageView!
    @IBOutlet weak var crewProg1: UIProgressView!
    
    //UI components for Crew Member 2
    @IBOutlet weak var crewMember2: UIStackView!
    @IBOutlet weak var crewName2: UILabel!
    @IBOutlet weak var crewImg2: UIImageView!
    @IBOutlet weak var crewProg2: UIProgressView!
    
    //UI components for Crew Member 3
    @IBOutlet weak var crewMember3: UIStackView!
    @IBOutlet weak var crewName3: UILabel!
    @IBOutlet weak var crewImg3: UIImageView!
    @IBOutlet weak var crewProg3: UIProgressView!
    
    //UI components for Crew Member 4
    @IBOutlet weak var crewMember4: UIStackView!
    @IBOutlet weak var crewName4: UILabel!
    @IBOutlet weak var crewImg4: UIImageView!
    @IBOutlet weak var crewProg4: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toggle the menu bar
        if self.revealViewController() != nil {
            self.revealViewController().revealToggleAnimated(true)
        }
        
        //create tap gesture for each of the views
        //a tap gesture can only be used with one corresponding view
        let tapGesture1 = UITapGestureRecognizer(target: self, action: Selector("handleTap1:"))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: Selector("handleTap2:"))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: Selector("handleTap3:"))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: Selector("handleTap4:"))
        
        // add gesture handlers to each crew member stack view
        crewMember1.userInteractionEnabled=true
        crewMember1.addGestureRecognizer(tapGesture1)
        
        crewMember2.userInteractionEnabled=true
        crewMember2.addGestureRecognizer(tapGesture2)
        
        crewMember3.userInteractionEnabled=true
        crewMember3.addGestureRecognizer(tapGesture3)
        
        crewMember4.userInteractionEnabled=true
        crewMember4.addGestureRecognizer(tapGesture4)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // handle the function of tapping member 1
    func handleTap1(sender:UITapGestureRecognizer){
        //go to segue
        self.performSegueWithIdentifier("showDetail1", sender: self)
    }
    
    // handle the function of tapping member 2
    func handleTap2(sender:UITapGestureRecognizer){
        //go to segue
        self.performSegueWithIdentifier("showDetail2", sender: self)
    }
    
    // handle the function of tapping member 3
    func handleTap3(sender:UITapGestureRecognizer){
        //go to segue
        self.performSegueWithIdentifier("showDetail3", sender: self)
    }
    
    // handle the function of tapping member 4
    func handleTap4(sender:UITapGestureRecognizer){
        //go to segue
        self.performSegueWithIdentifier("showDetail4", sender: self)
    }
    
    //send appropriate data to crew detail view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showDetail1" {
            
            let navVC = segue.destinationViewController as! UINavigationController
            let destVC = navVC.viewControllers.first as! CrewDetailViewController
            
            destVC.passName = crewName1.text
            destVC.passImage = crewImage1.image
            destVC.passProg = crewProg1.progress
            
        }
        if segue.identifier == "showDetail2" {
            
            let navVC = segue.destinationViewController as! UINavigationController
            let destVC = navVC.viewControllers.first as! CrewDetailViewController
            
            destVC.passName = crewName2.text
            destVC.passImage = crewImg2.image
            destVC.passProg = crewProg2.progress
            
        }
        if segue.identifier == "showDetail3" {
            
            let navVC = segue.destinationViewController as! UINavigationController
            let destVC = navVC.viewControllers.first as! CrewDetailViewController
            
            destVC.passName = crewName3.text
            destVC.passImage = crewImg3.image
            destVC.passProg = crewProg3.progress
            
        }
        if segue.identifier == "showDetail4" {
            
            let navVC = segue.destinationViewController as! UINavigationController
            let destVC = navVC.viewControllers.first as! CrewDetailViewController
            
            destVC.passName = crewName4.text
            destVC.passImage = crewImg4.image
            destVC.passProg = crewProg4.progress
            
        }
    }
    
}
