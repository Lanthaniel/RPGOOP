//
//  DevilWizard.swift
//  rpg-oop
//
//  Created by Nate on 4/27/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import Foundation


class DevilWizard: Enemy {
    
    //Set up unique loot
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    //Adjust the name of the enemy
    override var type: String {
        return "Devil Wizard"
    }
}