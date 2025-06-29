//
//  ViewController.swift
//  MyAdventure
//
//  Created by Noah Flood on 6/22/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    @IBOutlet weak var leftChoiceButton: UIButton!
        
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var rightChoiceButton: UIButton!
    
    // this automatically initalizes with the init function inside this instance
    var GAME_INSTANCE = GameLogic()
    
    var isGameOver = false // for preventing input between when the game is over and game has reset fully

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // here we handle initaliations with the UI (aka control)
        
        // hide the game over label
        gameOverLabel.text = ""
        gameOverLabel.isHidden = true
        
        // update the UI
        updateUI()
        
    }
    
    @objc func updateUI() {
        
        // go ahead and change the text
        gameStateLabel.text = GAME_INSTANCE.get_current_text()
        
        // first get the left and right choices now that the game is updated
        let left = GAME_INSTANCE.get_left_choice()
        let right = GAME_INSTANCE.get_right_choice()
        
        // ensure that we are not at an end node, and the game is over
        // if it is the end of the game
        if left.isEmpty && right.isEmpty {
            self.isGameOver = true
            
            leftChoiceButton.isHidden = true
            rightChoiceButton.isHidden = true
            
            // show the game over label
            gameOverLabel.text = "Game over! Resetting..."
            gameOverLabel.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
                self.GAME_INSTANCE = GameLogic() // reset instance
                self.leftChoiceButton.isHidden = false
                self.rightChoiceButton.isHidden = false
                self.gameOverLabel.isHidden = true
                self.updateUI() // refresh UI
                self.isGameOver = false
            }
            return
        }
        
        leftChoiceButton.setTitle(left, for: .normal)
        rightChoiceButton.setTitle(right, for: .normal)
        leftChoiceButton.isHidden = false
        rightChoiceButton.isHidden = false
        gameOverLabel.isHidden = true
        
        styleButton(leftChoiceButton)
        styleButton(rightChoiceButton)
        
    }
    
    
    @IBAction func leftButton(_ sender: UIButton) {
        // prevents tapping if the game is over
        guard !isGameOver, let userAction = sender.titleLabel?.text else {return}
        
        // we only update the game after a button is actually pressed
        GAME_INSTANCE.update_game(userAction)
        
        updateUI()
    }
    
    
    
    @IBAction func rightButton(_ sender: UIButton) {
        // prevents tapping if the game is over
        guard !isGameOver, let userAction = sender.titleLabel?.text else {return}
        
        // we only update the game after a button is actually pressed
        GAME_INSTANCE.update_game(userAction)
        
        updateUI()
    }
    
    // since buttons seem to be changing style when i set their text
    func styleButton(_ button: UIButton) {
        button.titleLabel?.font = UIFont(name: "Menlo-Bold", size: 10)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(.systemBlue, for: .normal)
    }
}

    
