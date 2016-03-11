//
//  Crew.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
//import RealmSwift
import CloudKit

public class Crew {
    
    public var name:String!
    public var user: CKReference!
    public let members:[CKReference] = []
    public let resources:[CKReference] = []
    
    convenience init(name: String, userID: String) {
        self.init()
        self.name = name
        
        let userRecord:CKRecordID = CKRecordID(recordName: userID)
        self.user = CKReference(recordID: userRecord, action: CKReferenceAction.DeleteSelf)
    }

    
    func save() -> Void{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        //recordType is the name of the table
        let record:CKRecord = CKRecord(recordType: "Crew")
        record.setObject(self.name, forKey: "crewName")
        record.setObject(self.user, forKey: "users")
        record.setObject(self.members, forKey: "member")
        record.setObject(self.resources, forKey: "resource")
        
        db.saveRecord(record) { (record:CKRecord?, error:NSError?) -> Void in
            if error == nil{
                print("record saved")
            }
        }
    }
    
    public static func loadAll() -> Void{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        let predicate:NSPredicate = NSPredicate(value: true)
        
        let query:CKQuery = CKQuery(recordType: "Crew", predicate: predicate)
        
        db.performQuery(query, inZoneWithID: nil) { (records: [CKRecord]?, error: NSError?) -> Void in
            
            if error != nil || records == nil {
                return //found errors
            }
            
            print(records)
            
        }
    }

}
