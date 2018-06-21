//
//  GameViewController.swift
//  GhibliFanApp
//
//  Created by Maryann Yin on 6/20/18.
//  Copyright © 2018 Maryann Yin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var activePlayer: Int = 1 //cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet weak var winnerAlertLabel: UILabel!

    @IBAction func actionButton(_ sender: Any) {
        if gameState[(sender as AnyObject).tag - 1] == 0 && gameIsActive == true {
            gameState[(sender as AnyObject).tag - 1] = activePlayer
            if activePlayer == 1 {
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: UIControlState.normal)
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: UIControlState.normal)
                activePlayer = 1
            }
        }
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                if gameState[combination[0]] == 1 {
                    winnerAlertLabel.text = "CROSS HAS WON"
                } else {
                    winnerAlertLabel.text = "NOUGHT HAS WON"
                }
                
                replayButtonOutlet.isHidden = false
                winnerAlertLabel.isHidden = false
            }
        }
        gameIsActive = false
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            winnerAlertLabel.text = "IT WAS A DRAW"
            winnerAlertLabel.isHidden = false
            replayButtonOutlet.isHidden = false
        }
    }
    
    
    @IBOutlet weak var replayButtonOutlet: UIButton!
    @IBAction func replayButton(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        replayButtonOutlet.isHidden = true
        winnerAlertLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
