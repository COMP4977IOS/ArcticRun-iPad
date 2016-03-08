//
//  ItemProtocol.swift
//  ArcticRun-iPad
//
//  Created by Kevin Chow Gonzalez on 2016-03-08.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation

@objc protocol ItemProtocol {
    var Id:Int {get set}
    optional var Cost:Int {get set}
    optional var Name:String {get set}
    optional var Text :String {get set}
    optional var Audio:AnyObject{get set}
    optional var Amount:Int {get set}
    optional var Date:NSDate {get set}
    
    func getId() -> Int
    
    optional func getCost() -> Int
    optional func setCost(cost:Int)
    
    optional func getName() -> String
    optional func setName(name:String)
    
    optional func getText() -> String
    optional func setText(text:String)
    
    optional func setAudio (file:AnyObject)
    optional func getAudio() -> AnyObject
    
    optional func getAmount() -> Int
    optional func setAmount(amount:Int)
    
    optional func getDate()->NSDate
    optional func setDate(date:NSDate)
    
}
