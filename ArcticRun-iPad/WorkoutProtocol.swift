//
//  WorkoutProtocol.swift
//  ArcticRun-iPad
//
//  Created by Kevin Chow Gonzalez on 2016-03-08.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation

protocol WorkoutProtocol {
    var Id:Int {get set}
    var startDate:NSDate {get set}
    var endDate:NSDate {get set}
    var Distance:Double {get set}
    var CaloriesBurned:Int {get set}
    var FastestSpeed:Double {get set}
    var startLocation : Int {get set}
    var endLocation :Int {get set}
    
    func getId() -> Int
    
    func getStartDate () -> NSDate
    func setStartDate (start:NSDate)
    
    func getEndDate () -> NSDate
    func setEndDate (end:NSDate)
    
    func getStartLocation() -> AnyObject
    func setStartLocation(startLoc:AnyObject)
    
    
    func getEndLocation() -> AnyObject
    func setEndLocation(endLoc:AnyObject)
    
    func getDistance() -> AnyObject
    func setDistance(dist:AnyObject)
    
    func setCaloriesBurned(cal:AnyObject)
    func getCaloriesBurned() -> AnyObject
    
    
}