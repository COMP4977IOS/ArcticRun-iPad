//
//  UserProtocol.swift
//  ArcticRun-iPad
//
//  Created by Kevin Chow Gonzalez on 2016-03-08.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation

@objc protocol UserProtocol {
    var Id:Int { get}
    var FirtName: String {get set}
    var LastName: String {get set}
    optional var Status: String {get set}
    optional var CaloriePoints:Int {get set}
    optional var GameLevel:Int {get set}
    
    func getId() -> Int
    
    func getFirstName() -> String
    func setFirstName (fName : String)
    
    func getLastName() -> String
    func setLastName (lName : String)
    
    optional func getStatus() -> String
    optional func setStatus(status:String)
    
    optional func getCaloriePoints()->Int
    optional func setCaloriePoints (points:Int)
    
    optional func getGameLevel() -> Int
    optional func setGameLevel (level:Int)
    
}