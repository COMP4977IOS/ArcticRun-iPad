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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toggle the menu bar
        if self.revealViewController() != nil {
            self.revealViewController().revealToggleAnimated(true)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
