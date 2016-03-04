//
//  Resource.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class Resource: Object {
    
    private dynamic var _amount:Int = 0
    private dynamic var _crew:Crew!
    private dynamic var _type:ResourceType!
    
    convenience init(amount:Int, crew:Crew, type:ResourceType) {
        self.init()
        self._amount = amount
        self._crew = crew
        self._type = type
    }
    
    public var amount:Int {
        get {
            return self._amount
        }
        set {
            self._amount = newValue
        }
    }
    
    public var crew:Crew {
        get {
            return self._crew
        }
        set {
            self._crew = newValue
        }
    }
    
    public var type:ResourceType {
        get {
            return self._type
        }
        set {
            self._type = newValue
        }
    }
    
}
