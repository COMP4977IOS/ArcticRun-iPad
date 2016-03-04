//
//  Selfie.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class Selfie: Object {

    private dynamic var _date:NSDate!
    private dynamic var _image:String!
    private dynamic var _user:User!
    
    convenience init(date:NSDate, image:String, user:User) {
        self.init()
        self._date = date
        self._image = image
        self._user = user
    }
    
    public var date:NSDate {
        get {
            return self._date
        }
        set {
            self._date = newValue
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
    
    public var user:User {
        get {
            return self._user
        }
        set {
            self._user = newValue
        }
    }
    
}
