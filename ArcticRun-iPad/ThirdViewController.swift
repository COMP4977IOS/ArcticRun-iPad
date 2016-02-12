//
//  ThirdViewController.swift
//  ArcticRun-iPad
//
//  Created by Jacky Lui on 2016-02-11.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import UIKit
import CloudKit

class ThirdViewController: UIViewController {
    
    var db:CKDatabase!
    
    @IBOutlet weak var txtField: UITextView!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCost: UITextField!
    @IBOutlet weak var txtRoleName: UITextField!
    @IBOutlet weak var txtRoleNumber: UITextField!
    
    
    @IBAction func didRefresh(sender: AnyObject) {
        self.loadCloudData()
    }
    @IBAction func didAdd(sender: AnyObject) {
        if txtName.text == "" ||  txtName.text == nil ||
        txtCost.text == "" ||  txtCost.text == nil ||
        txtRoleName.text == "" ||  txtRoleName.text == nil ||
        txtRoleNumber.text == "" ||  txtRoleNumber.text == nil {
            return
        }
        
        let itemRecord:CKRecord = CKRecord(recordType: "Character")
        
        itemRecord.setObject(txtName.text, forKey: "Name")
        itemRecord.setObject(Double(txtCost.text!), forKey: "Cost")
        itemRecord.setObject(txtRoleName.text, forKey: "RoleName")
        itemRecord.setObject(Double(txtRoleNumber.text!), forKey: "RoleNumber")
        
        db.saveRecord(itemRecord) { (record: CKRecord?, error:NSError?) -> Void in
            if error == nil {
                print("record saved successfully")
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.txtName.text = ""
                    self.txtCost.text = ""
                    self.txtRoleName.text = ""
                    self.txtRoleNumber.text = ""
                })
            } else {
                print(error)
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        // Do any additional setup after loading the view.
        self.loadCloudData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCloudData(){
        let predicate:NSPredicate = NSPredicate(value: true)
        txtField.text = "(fetching cloud data...)"
        let query:CKQuery = CKQuery(recordType: "Character", predicate: predicate)
        db.performQuery(query, inZoneWithID: nil) { (records:[CKRecord]?, error:NSError?) -> Void in
            if error != nil || records == nil{
                return  //found errors
            }
            
            
            var aList:[Character] = []
            for var i = 0; i < records?.count; i++ {
                let record:CKRecord = records![i]
                
                let name:String = record.objectForKey("Name") as! String
                let cost:Double = record.objectForKey("Cost") as! Double
                let roleName:String = record.objectForKey("RoleName") as! String
                let roleNumber:Int = record.objectForKey("RoleNumber") as! Int
                
                let character = Character(name: name, cost: cost, roleName: roleName, roleNumber: roleNumber)
                
                aList.append(character)
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                var output = ""
                
                for var i = 0; i < aList.count; i++ {
                    output += aList[i].string() + "\n"
                }
                
                self.txtField.text = output
            })
            
        }
    }
    
    //    private var name:String!
    //    private var cost:Double!
    //    private var roleName:String!
    //    private var roleNumber:Int64!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
