//
//  Selfie.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
//import RealmSwift
import CloudKit

public class Selfie {

    public var date:NSDate!
    public var image:CKAsset!
    public var user:CKReference!
    
    convenience init(date:NSDate, image:CKAsset, userID: String) {
        self.init()
        self.date = date
        self.image = image
        
        let userRecord:CKRecordID = CKRecordID(recordName: userID)
        self.user = CKReference(recordID: userRecord, action: CKReferenceAction.DeleteSelf)
    }
    
    func save() -> Void{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        //recordType is the name of the table
        let record:CKRecord = CKRecord(recordType: "Selfie")
        record.setObject(self.date, forKey: "date")
        record.setObject(self.image, forKey: "image")
        record.setObject(self.user, forKey: "users")
        
        db.saveRecord(record) { (record:CKRecord?, error:NSError?) -> Void in
            if error == nil{
                print("record saved")
            }
        }
    }
    
    public static func loadAll() -> Void{
        let db:CKDatabase = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        
        let predicate:NSPredicate = NSPredicate(value: true)
        
        let query:CKQuery = CKQuery(recordType: "Selfie", predicate: predicate)
        
        db.performQuery(query, inZoneWithID: nil) { (records: [CKRecord]?, error: NSError?) -> Void in
            
            if error != nil || records == nil {
                return //found errors
            }
            
            print(records)
            
        }
    }
    
}
