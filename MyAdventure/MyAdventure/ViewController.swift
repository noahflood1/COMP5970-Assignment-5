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
        
    @IBOutlet weak var rightChoiceButton: UIButton!
    
    // this automatically initalizes with the init function inside this instance
    var GAME_INSTANCE = GameLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        // here we handle initaliations with the UI
        gameStateLabel.text = GAME_INSTANCE.get_current_text()
        // Do any additional setup after loading the view.
    }
    
    @objc func updateUI() {
        
        
    }
    
}

