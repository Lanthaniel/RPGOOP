//
//  Character.swift
//  rpg-oop
//
//  Created by Nate on 4/27/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            }
            else {
                return true
            }
        }
    }
    
    init(startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        
        if(self._hp <= 0) {
            return false
        }
        self._hp -= attackPwr
        
        return true
    }
}
