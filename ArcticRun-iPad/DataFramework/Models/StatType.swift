//
//  StatType.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-03.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class StatType: Object {
    
    private dynamic var _name:String!
    
    convenience init(name:String) {
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
    
}
