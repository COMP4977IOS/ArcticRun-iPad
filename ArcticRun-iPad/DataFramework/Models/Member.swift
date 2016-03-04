//
//  Member.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class Member: Object {
    
    private dynamic var _crew:Crew!
    private dynamic var _firstName:String!
    private dynamic var _lastName:String!
    private dynamic var _item:Item!
    private dynamic var _status:String!
    
    public let stat = List<Stat>()
    
    convenience init(crew: Crew, firstName:String, lastName:String, item:Item, status:String) {
        self.init()
        self._crew = crew
        self._firstName = firstName
        self._lastName = lastName
        self._item = item
        self._status = status
    }
    
    public var crew:Crew {
        get {
            return self._crew
        }
        set {
            self._crew = newValue
        }
    }
    
    public var firstName:String {
        get {
            return self._firstName
        }
        set {
            self._firstName = newValue
        }
    }
    
    public var lastName:String {
        get {
            return self._lastName
        }
        set {
            self._lastName = newValue
        }
    }
    
    public var item:Item {
        get {
            return self._item
        }
        set {
            self._item = newValue
        }
    }
    
    public var status:String {
        get {
            return self._status
        }
        set {
            self._status = newValue
        }
    }
    
}
