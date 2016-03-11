//
//  StatsProtocol.swift
//  ArcticRun-iPad
//
//  Created by Kevin Chow Gonzalez on 2016-03-08.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation

@objc protocol StatsProtocol {
    var Id:Int {get set}
    optional var Amount :Int {get set}
    optional var StatsTypeName:String {get set}
    
    func getId()->Int
    
    func getAmount()-> Int
    func setAmount(amount:Int)
    
    func getStatsTypeName()->String
    func setStatsTypeName(name:String)
}