//
//  User.swift
//  ArcticRun-iPad
//
//  Created by Anthony on 2016-03-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation
import RealmSwift

public class User: Object {
    
    private dynamic var _caloriePoints:Int = 0
    private dynamic var _challengeId:Int = 0
    private dynamic var _firstName:String!
    private dynamic var _lastName:String!
    private dynamic var _gameLevel:Int = 0
    private dynamic var _workout:Workout!
    
    convenience init(caloriePoints:Int, challengeId:Int, firstName:String, lastName:String, gameLevel:Int, workout:Workout) {
        self.init()
        self._caloriePoints = caloriePoints
        self._challengeId = challengeId
        self._firstName = firstName
        self._lastName = lastName
        self._gameLevel = gameLevel
        self._workout = workout
    }
    
    public var caloriePoints:Int {
        get {
            return self._caloriePoints
        }
        set {
            self._caloriePoints = newValue
        }
    }
    
    public var challengeId:Int {
        get {
            return self._challengeId
        }
        set {
            self._challengeId = newValue
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
    
    public var gameLevel:Int {
        get {
            return self._gameLevel
        }
        set {
            self._gameLevel = newValue
        }
    }
    
    public var workout:Workout {
        get {
            return self._workout
        }
        set {
            self._workout = newValue
        }
    }
    
}
