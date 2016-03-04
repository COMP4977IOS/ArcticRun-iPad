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
    
    private dynamic var _crew:Crew!
    private dynamic var _date:NSDate!
    private dynamic var _text:String!
    
    convenience init(crew: Crew, date: NSDate, text:String) {
        self.init()
        self._crew = crew
        self._date = date
        self._text = text
    }
    
    public var crew:Crew {
        get {
            return self._crew
        }
        set {
            self._crew = newValue
        }
    }
    
    public var date:NSDate {
        get {
            return self._date
        }
        set {
            self._date = newValue
        }
    }
    
    public var text:String {
        get {
            return self._text
        }
        set {
            self._text = newValue
        }
    }
    
}
