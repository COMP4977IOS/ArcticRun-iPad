//
//  Crew.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import RealmSwift

public class Crew: Object {
    
    private dynamic var _name:String!
    private dynamic var _diary:Diary!
    
    public let members = List<Member>()
    public let resources = List<Resource>()
    
    convenience init(name: String) {
        self.init()
        self._name = name
    }
    
    public var name:String {
        get {
            return self._name
        }
        set {
            self._name = newValue
        }
    }
    
    public var diary:Diary {
        get {
            return self._diary
        }
        set {
            self._diary = newValue
        }
    }

}
