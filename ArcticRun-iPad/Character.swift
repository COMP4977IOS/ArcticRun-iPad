//
//  Character.swift
//  ArcticRun-iPad
//
//  Created by Jacky Lui on 2016-02-11.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation

class Character{
    
    private var name:String!
    private var cost:Double!
    private var roleName:String!
    private var roleNumber:Int!
    
    init(name: String, cost:Double, roleName:String, roleNumber:Int) {
        self.name = name
        self.cost = cost
        self.roleName = roleName
        self.roleNumber = roleNumber
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getCost() -> Double{
        return self.cost
    }
    
    func getRoleName() -> String{
        return self.roleName
    }
    
    func getRoleNumnber() -> Int{
        return self.roleNumber
    }
    
    func setName(name:String){
        self.name = name;
    }
    
    func setCost(cost:Double){
        self.cost = cost
    }
    
    func setRoleName(roleName:String){
        self.roleName = roleName
    }
    
    func setRoleNumber(roleNumber:Int){
        self.roleNumber = roleNumber
    }
    
    func string() -> String {
        return "\(self.name) \(self.cost) \(self.roleName) \(self.roleNumber)"
    }
    
}