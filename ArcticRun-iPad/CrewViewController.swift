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
    
    @IBOutlet weak var crewMember1: UIStackView!
    @IBOutlet weak var crewMember2: UIStackView!
    @IBOutlet weak var crewMember3: UIStackView!
    @IBOutlet weak var crewMember4: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toggle the menu bar
        if self.revealViewController() != nil {
            self.revealViewController().revealToggleAnimated(true)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        
        // add gesture handlers to each crew member stack view
        crewMember1.userInteractionEnabled=true
        crewMember1.addGestureRecognizer(tapGesture)
        crewMember2.userInteractionEnabled=true
        crewMember2.addGestureRecognizer(tapGesture)
        crewMember3.userInteractionEnabled=true
        crewMember3.addGestureRecognizer(tapGesture)
        crewMember4.userInteractionEnabled=true
        crewMember4.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // handle the function of tapping a member
    func handleTap(sender:UITapGestureRecognizer){
        // make this actually go to details storyboard
        print("tap")
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
