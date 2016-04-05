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
    @IBOutlet weak var crewStatus1: UILabel!
    
    //UI components for Crew Member 2
    @IBOutlet weak var crewMember2: UIStackView!
    @IBOutlet weak var crewName2: UILabel!
    @IBOutlet weak var crewImg2: UIImageView!
    @IBOutlet weak var crewProg2: UIProgressView!
    @IBOutlet weak var crewStatus2: UILabel!
    
    //UI components for Crew Member 3
    @IBOutlet weak var crewMember3: UIStackView!
    @IBOutlet weak var crewName3: UILabel!
    @IBOutlet weak var crewImg3: UIImageView!
    @IBOutlet weak var crewProg3: UIProgressView!
    @IBOutlet weak var crewStatus3: UILabel!
    
    //UI components for Crew Member 4
    @IBOutlet weak var crewMember4: UIStackView!
    @IBOutlet weak var crewName4: UILabel!
    @IBOutlet weak var crewImg4: UIImageView!
    @IBOutlet weak var crewProg4: UIProgressView!
    @IBOutlet weak var crewStatus4: UILabel!
    
    //UI components for Crew Member 5
    @IBOutlet weak var crewMember5: UIStackView!
    @IBOutlet weak var crewName5: UILabel!
    @IBOutlet weak var crewImg5: UIImageView!
    @IBOutlet weak var crewProg5: UIProgressView!
    @IBOutlet weak var crewStatus5: UILabel!
    
    // UI components for items
    @IBOutlet weak var beetroot_soup: UIImageView!
    @IBOutlet weak var bread: UIImageView!
    @IBOutlet weak var fish: UIImageView!
    @IBOutlet weak var cooked_chicken: UIImageView!
    @IBOutlet weak var cooked_fish: UIImageView!
    @IBOutlet weak var cooked_porkchop: UIImageView!
    @IBOutlet weak var mushroom_stew: UIImageView!
    @IBOutlet weak var hat: UIImageView!
    @IBOutlet weak var leather_boots: UIImageView!
    @IBOutlet weak var leather_pants: UIImageView!
    @IBOutlet weak var leather_chestplate: UIImageView!
    @IBOutlet weak var leather_helmet: UIImageView!
    @IBOutlet weak var coat: UIImageView!
    @IBOutlet weak var iron_pickaxe: UIImageView!
    
    // money
    @IBOutlet weak var bank: UILabel!
    private var money: Int = 0;
    
    // item prices
    private let PRICE_BEETROOT_SOUP = 1000;
    private let PRICE_BREAD = 1000;
    private let PRICE_FISH = 1000;
    private let PRICE_COOKED_CHICKEN = 1000;
    private let PRICE_COOKED_FISH = 1000;
    private let PRICE_COOKED_PORKCHOP = 1000;
    private let PRICE_MUSHROOM_STEW = 1000;
    private let PRICE_HAT = 1000;
    private let PRICE_LEATHER_BOOTS = 1000;
    private let PRICE_LEATHER_PANTS = 1000;
    private let PRICE_LEATHER_CHESTPLATE = 1000;
    private let PRICE_LEATHER_HELMET = 1000;
    private let PRICE_COAT = 1000;
    private let PRICE_IRON_PICKAXE = 1000;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //create tap gesture for each of the views
        //a tap gesture can only be used with one corresponding view
        let tapGesture1 = UITapGestureRecognizer(target: self, action: Selector("handleTap1:"))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: Selector("handleTap2:"))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: Selector("handleTap3:"))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: Selector("handleTap4:"))
        
        // tap gestures for items
        let tapGesture5 = UITapGestureRecognizer(target: self, action: Selector("beetroot_soup:"))
        let tapGesture6 = UITapGestureRecognizer(target: self, action: Selector("bread:"))
        let tapGesture7 = UITapGestureRecognizer(target: self, action: Selector("fish:"))
        let tapGesture8 = UITapGestureRecognizer(target: self, action: Selector("cooked_chicken:"))
        let tapGesture9 = UITapGestureRecognizer(target: self, action: Selector("cooked_fish:"))
        let tapGesture10 = UITapGestureRecognizer(target: self, action: Selector("cooked_porkchop:"))
        let tapGesture11 = UITapGestureRecognizer(target: self, action: Selector("mushroom_stew:"))
        let tapGesture12 = UITapGestureRecognizer(target: self, action: Selector("hat:"))
        let tapGesture13 = UITapGestureRecognizer(target: self, action: Selector("leather_boots:"))
        let tapGesture14 = UITapGestureRecognizer(target: self, action: Selector("leather_pants:"))
        let tapGesture15 = UITapGestureRecognizer(target: self, action: Selector("leather_chestplate:"))
        let tapGesture16 = UITapGestureRecognizer(target: self, action: Selector("leather_helmet:"))
        let tapGesture17 = UITapGestureRecognizer(target: self, action: Selector("coat:"))
        let tapGesture18 = UITapGestureRecognizer(target: self, action: Selector("iron_pickaxe:"))
        
        // add gesture handlers to each crew member stack view
        crewMember1.userInteractionEnabled=true
        crewMember1.addGestureRecognizer(tapGesture1)
        
        crewMember2.userInteractionEnabled=true
        crewMember2.addGestureRecognizer(tapGesture2)
        
        crewMember3.userInteractionEnabled=true
        crewMember3.addGestureRecognizer(tapGesture3)
        
        crewMember4.userInteractionEnabled=true
        crewMember4.addGestureRecognizer(tapGesture4)
        
        // add gesture handlers to each item
        beetroot_soup.userInteractionEnabled = true
        beetroot_soup.addGestureRecognizer(tapGesture5)
        
        bread.userInteractionEnabled = true
        bread.addGestureRecognizer(tapGesture6)
        
        fish.userInteractionEnabled = true
        fish.addGestureRecognizer(tapGesture7)
        
        cooked_chicken.userInteractionEnabled = true
        cooked_chicken.addGestureRecognizer(tapGesture8)
        
        cooked_fish.userInteractionEnabled = true
        cooked_fish.addGestureRecognizer(tapGesture9)
    
        cooked_porkchop.userInteractionEnabled = true
        cooked_porkchop.addGestureRecognizer(tapGesture10)
        
        mushroom_stew.userInteractionEnabled = true
        mushroom_stew.addGestureRecognizer(tapGesture11)
        
        hat.userInteractionEnabled = true
        hat.addGestureRecognizer(tapGesture12)
        
        leather_boots.userInteractionEnabled = true
        leather_boots.addGestureRecognizer(tapGesture13)
        
        leather_pants.userInteractionEnabled = true
        leather_pants.addGestureRecognizer(tapGesture14)
        
        leather_chestplate.userInteractionEnabled = true
        leather_chestplate.addGestureRecognizer(tapGesture15)
        
        leather_helmet.userInteractionEnabled = true
        leather_helmet.addGestureRecognizer(tapGesture16)
        
        coat.userInteractionEnabled = true
        coat.addGestureRecognizer(tapGesture17)
        
        iron_pickaxe.userInteractionEnabled = true
        iron_pickaxe.addGestureRecognizer(tapGesture18)
        
        // Add initial money amount
        Crew.getAllCrews { (crews: [Crew]) -> Void in
            for var i = 0; i < crews.count; i++ {
                self.money = crews[i].getCaloriePoints()!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.bank.text = "$" + self.money.description
            }
        }
        
        // Get initial health and statii
        Member.getAllMembers { (members: [Member]) -> Void in
            dispatch_async(dispatch_get_main_queue()) {
                self.crewName1.text = members[0].getFirstName()! + " " + members[0].getLastName()!
                self.crewProg1.progress = members[0].getHealth()! / 100.00
                self.crewStatus1.text = "Status: " + members[0].getStatus()!
                
                self.crewName2.text = members[1].getFirstName()! + " " + members[1].getLastName()!
                self.crewProg2.progress = members[1].getHealth()! / 100.00
                self.crewStatus2.text = "Status: " + members[1].getStatus()!
                
                self.crewName3.text = members[2].getFirstName()! + " " + members[2].getLastName()!
                self.crewProg3.progress = members[2].getHealth()! / 100.00
                self.crewStatus3.text = "Status: " + members[2].getStatus()!
                
                self.crewName4.text = members[3].getFirstName()! + " " + members[3].getLastName()!
                self.crewProg4.progress = members[3].getHealth()! / 100.00
                self.crewStatus4.text = "Status: " + members[3].getStatus()!
                
                self.crewName5.text = members[4].getFirstName()! + " " + members[4].getLastName()!
                self.crewProg5.progress = members[4].getHealth()! / 100.00
                self.crewStatus5.text = "Status: " + members[4].getStatus()!
            }
        }
    }
    
    private func buyItem(price: Int) {
        if (self.money >= price) {
            self.showBuyMenu(price)
        } else {
            self.showPriceError(price)
        }
    }
    
    private func showBuyMenu(price: Int) {
        let controller = UIAlertController(title: "Price: $" + price.description, message: "Choose a crew member to purchase the item for.", preferredStyle: .Alert)
        
        let crewMember1 = UIAlertAction(title: crewName1.text, style: .Default) { (UIAlertAction) -> Void in
            self.removeMoney(price)
        }
        let crewMember2 = UIAlertAction(title: crewName2.text, style: .Default) { (UIAlertAction) -> Void in
            self.removeMoney(price)
        }
        let crewMember3 = UIAlertAction(title: crewName3.text, style: .Default) { (UIAlertAction) -> Void in
            self.removeMoney(price)
        }
        let crewMember4 = UIAlertAction(title: crewName4.text, style: .Default) { (UIAlertAction) -> Void in
            self.removeMoney(price)
        }
        let crewMember5 = UIAlertAction(title: crewName5.text, style: .Default) { (UIAlertAction) -> Void in
            self.removeMoney(price)
        }
        
        let dismiss = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        
        controller.addAction(crewMember1)
        controller.addAction(crewMember2)
        controller.addAction(crewMember3)
        controller.addAction(crewMember4)
        controller.addAction(crewMember5)
        controller.addAction(dismiss)
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    private func showPriceError(price: Int) {
        let controller = UIAlertController(title: "You don't have enough money.", message: "This item costs $" + price.description, preferredStyle: .Alert)
        
        let dismiss = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        
        controller.addAction(dismiss)
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    private func removeMoney(price: Int) {
        money -= price
        Crew.getAllCrews { (crews: [Crew]) -> Void in
            for var i = 0; i < crews.count; i++ {
                crews[i].setCaloriePoints(self.money)
                crews[i].save()
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.bank.text = "$" + self.money.description
            }
        }
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
    
    // handle tappings of items
    func beetroot_soup(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_BEETROOT_SOUP)
    }
    
    func bread(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_BREAD)
    }
    
    func fish(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_FISH)
    }
    
    func cooked_chicken(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_COOKED_CHICKEN)
    }
    
    func cooked_fish(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_COOKED_FISH)
    }
    
    func cooked_porkchop(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_COOKED_PORKCHOP)
    }
    
    func mushroom_stew(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_MUSHROOM_STEW)
    }
    
    func hat(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_HAT)
    }
    
    func leather_boots(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_LEATHER_BOOTS)
    }
    
    func leather_pants(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_LEATHER_PANTS)
    }
    
    func leather_chestplate(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_LEATHER_CHESTPLATE)
    }
    
    func leather_helmet(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_LEATHER_HELMET)
    }
    
    func coat(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_COAT)
    }
    
    func iron_pickaxe(sender:UITapGestureRecognizer) {
        self.buyItem(PRICE_IRON_PICKAXE)
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
