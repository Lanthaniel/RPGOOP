//
//  Kimara.swift
//  rpg-oop
//
//  Created by Nate on 4/27/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation


class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    //override the loot array to allow for more valuable loot
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Trident"]
    }
    
    //change type to reflect Kimara
    override var type: String {
        return "Kimara"
    }
    
    //Kimara does not take damage from attacks less than 15
    override func attemptAttack(attackPwr: Int) -> Bool {
        if (attackPwr >= IMMUNE_MAX) {
            return super.attemptAttack(attackPwr)
        }
        else {
            return false
        }
    }
    
}