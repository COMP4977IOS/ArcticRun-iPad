//
//  ViewController.swift
//  artuicasd
//
//  Created by Trevor Broderick on 2016-02-09.
//  Copyright © 2016 Trevor Broderick. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    @IBOutlet weak var stepsField: UITextField!
    @IBOutlet weak var kilometersField: UITextField!
    @IBOutlet weak var minutesField: UITextField!
    @IBOutlet weak var caloriesBurnedField: UITextField!
    
    let currentToken = NSFileManager.defaultManager().ubiquityIdentityToken
    var goals: Array<CKRecord> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Fetch existing record based off user id and populate the fields
        if (currentToken != nil) {
            iCloudUserIDAsync() {
                recordID, error in
                if let userID = recordID?.recordName {
                    let container = CKContainer.defaultContainer()
                    let database = container.publicCloudDatabase
                    
                    // Get all the goal records given the users id (should only be one goal record or none)
                    let query = CKQuery(recordType: "Goal", predicate: NSPredicate(format: "%K == %@", "creatorUserRecordID" ,CKReference(recordID: recordID!, action: CKReferenceAction.None)))
                    
                    database.performQuery(query, inZoneWithID: nil) { (results, error) -> Void in
                        if error != nil {
                            print(error)
                        } else {
                            for result in results! {
                                self.goals.append(result)
                            }
                            
                            if (!self.goals.isEmpty) {
                                print("populated fields using existing goal record")
                                
                                let goalRecord = self.goals[0];
                                
                                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                    self.stepsField.text = String (goalRecord.valueForKey("stepsDaily")!)
                                    self.caloriesBurnedField.text = String (goalRecord.valueForKey("caloriesBurnedDaily")!)
                                    self.kilometersField.text = String (goalRecord.valueForKey("distanceKilometersDaily")!)
                                    self.minutesField.text = String (goalRecord.valueForKey("minutesDaily")!)
                                })
                            } else {
                                print("no existing goal record")
                            }
                            
                        }
                    }
                    
                    print("received iCloudID \(userID)")
                } else {
                    print("Fetched iCloudID was nil")
                }
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if (currentToken == nil) {
            let alertController = UIAlertController(title: "iCloud Connection Required", message: "You must enable iCloud on your device to set your goals.", preferredStyle: .Alert)
            let dismissAction   = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alertController.addAction(dismissAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            print("requires icloud connection");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveToCloud(sender: AnyObject) {
        if (currentToken != nil) {
            
            iCloudUserIDAsync() {
                recordID, error in
                if let userID = recordID?.recordName {
                    let container = CKContainer.defaultContainer()
                    let database = container.publicCloudDatabase
                    
                    // Get all the goal records given the users id (should only be one goal record or none)
                    let query = CKQuery(recordType: "Goal", predicate: NSPredicate(format: "%K == %@", "creatorUserRecordID" ,CKReference(recordID: recordID!, action: CKReferenceAction.None)))
                    
                    database.performQuery(query, inZoneWithID: nil) { (results, error) -> Void in
                        if error != nil {
                            print(error)
                        } else {
                            for result in results! {
                                self.goals.append(result)
                            }
                            
                            if (!self.goals.isEmpty) {
                                print("updated old goal record")
                                self.updateGoalRecord(database)
                            } else {
                                self.createNewGoalRecord(database)
                                print("created new goal record")
                            }

                        }
                    }
                    
                    print("received iCloudID \(userID)")
                } else {
                    print("Fetched iCloudID was nil")
                }
            }
        }
        
    }
    
    /// async gets iCloud record name of logged-in user
    func iCloudUserIDAsync(complete: (instance: CKRecordID?, error: NSError?) -> ()) {
        let container = CKContainer.defaultContainer()
        container.fetchUserRecordIDWithCompletionHandler() {
            recordID, error in
            if error != nil {
                print(error!.localizedDescription)
                complete(instance: nil, error: error)
            } else {
                print("fetched ID \(recordID?.recordName)")
                complete(instance: recordID, error: nil)
            }
        }
    }
    
    private func createNewGoalRecord(database: CKDatabase) {
        let timestampAsString = String(format: "%f", NSDate.timeIntervalSinceReferenceDate())
        let timestampParts = timestampAsString.componentsSeparatedByString(".")
        let goalID = CKRecordID(recordName: timestampParts[0])
        let goalRecord = CKRecord(recordType: "Goal", recordID: goalID)
        
        goalRecord.setObject(Int(self.stepsField.text!), forKey: "stepsDaily")
        goalRecord.setObject(Int(self.caloriesBurnedField.text!), forKey: "caloriesBurnedDaily")
        goalRecord.setObject(Int(self.minutesField.text!), forKey: "minutesDaily")
        goalRecord.setObject(Int(self.kilometersField.text!), forKey: "distanceKilometersDaily")
        
        database.saveRecord(goalRecord, completionHandler: { (record, error) -> Void in
            if (error != nil) {
                print(error)
            }
        })
    }
    
    private func updateGoalRecord(database: CKDatabase) {
        let goalRecord = self.goals[0];
        
        // Modify the record
        print("updating old")
        
        goalRecord.setObject(Int(self.stepsField.text!), forKey: "stepsDaily")
        goalRecord.setObject(Int(self.caloriesBurnedField.text!), forKey: "caloriesBurnedDaily")
        goalRecord.setObject(Int(self.minutesField.text!), forKey: "minutesDaily")
        goalRecord.setObject(Int(self.kilometersField.text!), forKey: "distanceKilometersDaily")
        
        database.saveRecord(goalRecord, completionHandler: { (record, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                print("successfully updated record")
            }
        })
    }
}

