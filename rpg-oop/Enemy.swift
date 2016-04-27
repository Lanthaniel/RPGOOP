//
//  Enemy.swift
//  rpg-oop
//
//  Created by Nate on 4/27/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation


class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty Dagger","Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    //drop loot if the enemy dies
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}