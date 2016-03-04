//
//  Item.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class Item: Object {
    
    private dynamic var _amount:Int = 0
    private dynamic var _itemType:ItemType!
    private dynamic var _member:Member!
    
    convenience init(amount:Int, itemType:ItemType, member:Member) {
        self.init()
        self._amount = amount
        self._itemType = itemType
        self._member = member
    }
    
    public var amount:Int {
        get {
            return self._amount
        }
        set {
            self._amount = newValue
        }
    }
    
    public var itemType:ItemType {
        get {
            return self._itemType
        }
        set {
            self._itemType = newValue
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
    
}
