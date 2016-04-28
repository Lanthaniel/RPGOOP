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
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Lanthaniel", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHPLbl.text = "\(player.hp) HP"
    }
    
    //Function to generate a random enemy, and update the displayed text
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        //select random enemy based on random number
        if (rand == 0) {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
        }
        else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
        enemyHPLbl.text = "\(enemy.hp) HP"
    }

    
    //Function to hide the chest and call for a new enemy to generate
    @IBAction func onChestPressed(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    //Function to attack enemy
    @IBAction func onAttackPressed(sender: AnyObject) {
        
        //if attack succeeds, update HP label and Game Message
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
            
            //if loot is dropped, display informative text and reveal the chest
            if let loot = enemy.dropLoot() {
                player.addItemToInventory(loot)
                chestMessage = "\(player.name) found \(loot)"
                chestBtn.hidden = false
            }
            
            //if enemy dies, inform the player and remove the enemy
            if !enemy.isAlive {
                enemyHPLbl.text = ""
                printLbl.text = "Killed \(enemy.type)"
                enemyImg.hidden = true
            }
        }
        //if attack fails inform the player
        else {
            //if the monster is dead AKA there is nothing to attack
            if( enemy.hp <= 0) {
                printLbl.text = "Hold your horses! There is nothing to attack..."
            }
            else {
                printLbl.text = "Attack was unsuccessful!"
            }
        }
    }

}

