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
    private dynamic var _image:String!
    
    convenience init(name:String, image:String) {
        self.init()
        self._name = name
        self._image = image
    }
    
    public var name:String {
        get {
            return self._name
        }
        set {
            self._name = newValue
        }
    }
    
    public var image:String {
        get {
            return self._image
        }
        set {
            self._image = newValue
        }
    }
    
}
