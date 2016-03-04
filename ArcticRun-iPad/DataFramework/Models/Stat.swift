//
//  Stat.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class Stat: Object {
    
    private dynamic var _amount:Int = 0
    private dynamic var _member:Member!
    private dynamic var _type:StatType!
    
    convenience init(amount:Int, member:Member, type:StatType) {
        self.init()
        self._amount = amount
        self._member = member
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
    
    public var member:Member {
        get {
            return self._member
        }
        set {
            self._member = newValue
        }
    }
    
    public var type:StatType {
        get {
            return self._type
        }
        set {
            self._type = newValue
        }
    }
    
}
