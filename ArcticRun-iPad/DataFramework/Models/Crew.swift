//
//  Crew.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import CloudKit

public class Crew {
    
    let publicDB:CKDatabase = CKContainer.defaultContainer().publicCloudDatabase
    
    var user: CKReference?  //reference to the user of this crew
    var record:CKRecord?    //a record of this instance
    var isReady:Bool = false
    
    init(userRecord: CKRecord) {
        self.user = CKReference(record: userRecord, action: CKReferenceAction.DeleteSelf)   //set a reference to user
        
        let predicate:NSPredicate = NSPredicate(format: "user == %@", self.user!)   //get all crews under the referenced user
        let query:CKQuery = CKQuery(recordType: "Crew", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]   //sort by desc
        
        //perform query
        publicDB.performQuery(query, inZoneWithID: nil) { (records: [CKRecord]?, error: NSError?) -> Void in
            if(error != nil || records == nil){
                return  //nothing
            }
            
            self.record = records![0]
            self.isReady = true     //crew ready
        }
    }
    
    func getCaloriePoints() -> Int {
        return self.record?.objectForKey("caloriePoints") as! Int
    }
    
    func setCaloriePoints(caloriesPoints:Int) -> Void {
        self.record?.setObject(caloriesPoints, forKey: "caloriePoints")
    }
    
    func getChallengeID() -> Int {
        return self.record?.objectForKey("challengeID") as! Int
    }
    
    func setChallengeID(challengeID: Int) -> Void {
        self.record?.setObject(challengeID, forKey: "challengeID")
    }
    
    func getGameLevel() -> Int {
        return self.record?.objectForKey("gameLevel") as! Int
    }
    
    func setGameLevel(gameLevel: Int) -> Void {
        self.record?.setObject(gameLevel, forKey: "gameLevel")
    }
    
    func getMemberReferences() -> [CKReference] {
        return self.record?.objectForKey("member") as! [CKReference]
    }
    
    func setMemberReferences(references: [CKReference]) -> Void {
        self.record?.setObject(references, forKey: "member")
    }
    
    func getName() -> String {
        return self.record?.objectForKey("name") as! String
    }
    
    func setName(name: String) -> Void {
        self.record?.setObject(name, forKey: "name")
    }
    
    func getResourceReferences() -> [CKReference] {
        return self.record?.objectForKey("resource") as! [CKReference]
    }
    
    func setResourceReferences(references: [CKReference]) -> Void {
        self.record?.setObject(references, forKey: "resource")
    }
    
    func getUserReference() -> CKReference {
        return self.record?.objectForKey("user") as! CKReference
    }
    
    func setUserReference(reference: CKReference) -> Void {
        self.record?.setObject(reference, forKey: "user")
    }
    
    func getWorkoutReferences() -> [CKReference] {
        return self.record?.objectForKey("workout") as! [CKReference]
    }
    
    func setWorkoutReferences(references: [CKReference]) -> Void {
        self.record?.setObject(references, forKey: "workout")
    }
    
    func save() -> Void{
        publicDB.saveRecord(self.record!) { (record: CKRecord?, error:NSError?) -> Void in
            if error == nil {
                print("record saved")
            }
        }
    }
    
    public static func loadAll() -> [CKRecord]{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        let predicate:NSPredicate = NSPredicate(value: true)
        
        let query:CKQuery = CKQuery(recordType: "Crew", predicate: predicate)
        
        db.performQuery(query, inZoneWithID: nil) { (records: [CKRecord]?, error: NSError?) -> Void in
            
            if error != nil || records == nil {
                return //found errors
            }
            
            print(records)
            return records!
            

            
        }
    }

}
