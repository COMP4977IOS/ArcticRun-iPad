//
//  Goal.swift
//  ArcticRun-iPad
//
//  Created by Khoa Nguyen on 2016-03-29.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import CloudKit
import UIKit

class Goal: NSObject {
    var recordID: CKRecordID!
    var calories: Int!
    var distance: Int!
    var minutes: Int!
    var steps: Int!
}