//
//  CrewDetailViewController.swift
//  ArcticRun-iPad
//
//  Created by Aicha Hezit on 2016-03-10.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

//import Foundation
import UIKit

class CrewDetailViewController: UIViewController {
    
    //UI components to be filled with member data passed through the segue
    @IBOutlet weak var crewName: UILabel!
    @IBOutlet weak var crewImg: UIImageView!
    @IBOutlet weak var crewProg: UIProgressView!
    
    //variables to store data passed through the segue
    var passName: String!
    var passImage: UIImage!
    var passProg: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set UI components to the segue data
        crewName.text = passName
        crewImg.image = passImage
        crewProg.progress = passProg
        
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}