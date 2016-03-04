//
//  Workout.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

public class Workout: Object {
    
    private dynamic var _caloriesBurned:Int = 0
    private dynamic var _distance:Double = 0
    private dynamic var _fastestSpeed:Double = 0
    private dynamic var _startTime:NSDate!
    private dynamic var _endTime:NSDate!
    private dynamic var _startLocation:CLLocation!
    private dynamic var _endLocation:CLLocation!
    
    convenience init(caloriesBurned:Int, distance:Double, fastestSpeed:Double, startTime:NSDate, endTime:NSDate, startLocation:CLLocation, endLocation:CLLocation) {
        self.init()
        self._caloriesBurned = caloriesBurned
        self._distance = distance
        self._fastestSpeed = fastestSpeed
        self._startTime = startTime
        self._endTime = endTime
        self._startLocation = startLocation
        self._endLocation = endLocation
    }
    
    public var caloriesBurned:Int {
        get {
            return self._caloriesBurned
        }
        set {
            self._caloriesBurned = newValue
        }
    }
    
    public var distance:Double {
        get {
            return self._distance
        }
        set {
            self._distance = newValue
        }
    }
    
    public var fastestSpeed:Double {
        get {
            return self._fastestSpeed
        }
        set {
            self._fastestSpeed = newValue
        }
    }
    
    public var startTime:NSDate {
        get {
            return self._startTime
        }
        set {
            self._startTime = newValue
        }
    }
    
    public var endTime:NSDate {
        get {
            return self._endTime
        }
        set {
            self._endTime = newValue
        }
    }
    
    public var startLocation:CLLocation {
        get {
            return self._startLocation
        }
        set {
            self._startLocation = newValue
        }
    }
    
    public var endLocation:CLLocation {
        get {
            return self._endLocation
        }
        set {
            self._endLocation = newValue
        }
    }
    
}
