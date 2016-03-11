//
//  Diary.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class Diary: Object {
    
    private var crew:Crew!
    private dynamic var date:NSDate!
    private dynamic var text:String!
    
    convenience init(crew: Crew, date: NSDate, text:String) {
        self.init()
        self.crew = crew
        self.date = date
        self.text = text
    }
    
    
    
    
    
}
