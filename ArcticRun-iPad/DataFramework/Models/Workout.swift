//
//  Workout.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
//import RealmSwift
import CoreLocation
import CloudKit

public class Workout {
    
    public var caloriesBurned:Int = 0
    public var distance:Double = 0
    public var fastestSpeed:Double = 0
    public var startDate:NSDate!
    public var endDate:NSDate!
    public var startLocation:CLLocation!
    public var endLocation:CLLocation!
    public var steps:Int = 0
    public var user:CKReference!
    
    convenience init(caloriesBurned:Int, distance:Double, fastestSpeed:Double, startDate:NSDate, endDate:NSDate, startLocation:CLLocation, endLocation:CLLocation, steps: Int, userID: String) {
        self.init()
        self.caloriesBurned = caloriesBurned
        self.distance = distance
        self.fastestSpeed = fastestSpeed
        self.startDate = startDate
        self.endDate = endDate
        self.startLocation = startLocation
        self.endLocation = endLocation
        self.steps = steps
        
        let userRecord:CKRecordID = CKRecordID(recordName: userID)
        self.user = CKReference(recordID: userRecord, action: CKReferenceAction.DeleteSelf)
    }
    
    func save() -> Void{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        //recordType is the name of the table
        let record:CKRecord = CKRecord(recordType: "Workout")
        record.setObject(self.caloriesBurned, forKey: "caloriesBurned")
        record.setObject(self.distance, forKey: "distance")
        record.setObject(self.fastestSpeed, forKey: "fastestSpeed")
        record.setObject(self.startDate, forKey: "startDate")
        record.setObject(self.endDate, forKey: "endDate")
        record.setObject(self.startDate, forKey: "startDate")
        record.setObject(self.startLocation, forKey: "startLocation")
        record.setObject(self.endLocation, forKey: "endLocation")
        record.setObject(self.steps, forKey: "steps")
        
        db.saveRecord(record) { (record:CKRecord?, error:NSError?) -> Void in
            if error == nil{
                print("record saved")
            }
        }
    }
    
    public static func loadAll() -> Void{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        let predicate:NSPredicate = NSPredicate(value: true)
        
        let query:CKQuery = CKQuery(recordType: "Workout", predicate: predicate)
        
        db.performQuery(query, inZoneWithID: nil) { (records: [CKRecord]?, error: NSError?) -> Void in
            
            if error != nil || records == nil {
                return //found errors
            }
            
            print(records)
            
        }
    }
    
}
