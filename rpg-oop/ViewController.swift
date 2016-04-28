//
//  ViewController.swift
//  rpg-oop
//
//  Created by Nate on 4/27/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlet ceclarations
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHPLbl: UILabel!
    
    @IBOutlet weak var enemyHPLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    //properties
    var player: Player!
    var enemy: Enemy!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Lanthaniel", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHPLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if (rand == 0) {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
        }
        else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
    }

    @IBOutlet weak var onChestPressed: UIButton!
    

}

