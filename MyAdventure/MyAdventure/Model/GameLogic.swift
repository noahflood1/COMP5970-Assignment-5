//
//  GameLogic.swift
//  MyAdventure
//
//  Created by Noah Flood on 6/25/25.
//

import Foundation

struct GameLogic {
    
    // maps each action to a consequence statement in the case that it is chosen so that the
    // current text can be updated
    // this seems kind of janky but it's what I came up with for these purposes
    var consequenceMap: [String: String] = [
        "Hire a private boat captain" : "You hired a private boat captain.",
        "Hire a private flight pilot" : "You hired a private flight pilot.",
        "Take over control of the plane" : "You took over the plane. Within a few minutes, you see something miles away on the horizon, rising out of the ocean water...",
        "Read a book in the back" : "You decided to read a book in the back of the plane and fell asleep.",
        "Sail the seven seas" : "You sailed the seven seas and found the treaure!",
        "Jump onto the back of a whale" : "You jumped onto the back of a whale and explored the ocean."
    ]
    
    // bottom level... all final choices lead to this node
    var end_node = ChoiceNode("", "", nil, nil, true)
    
    // second level choices
    lazy var choice2 = ChoiceNode("Sail the seven seas", "Jump onto the back of a whale", end_node, end_node)
    lazy var choice3 = ChoiceNode("Take over control of the plane", "Read a book in the back", end_node, end_node)
    
    // first level choices
    lazy var choice1 = ChoiceNode("Hire a private boat captain", "Hire a private flight pilot", choice2, choice3)
    
    // store the current text displayed on screen and the current choice being displayed
    var current_text: String
    var current_choice: ChoiceNode! // I think you need this exclamation mark here
    
    init () {
        self.current_text = "You found the map of 'The Treasure on Pirate Island'"
        self.current_choice = self.choice1
    }
    
    
    
    mutating func update_game(_ action: String) {
        // progress to the next choice
        if action == current_choice.leftChoice {
            current_choice = current_choice.leftNext!
            set_current_text(action)
        } else if action == current_choice.rightChoice {
            current_choice = current_choice.rightNext!
            set_current_text(action)
        } else {
            // silent crash if the choice doesn't match any of the available current choices
            print("something is wrong...")
            set_current_text(action)
        }
       
    }
    
    
    
    mutating func set_current_text(_ action: String) {
        if let text = consequenceMap[action] { // this is called optional binding, needed since the consequence map could return the wrong thing
            current_text = text
        } else {
            current_text = "Unknown consequence for action: \(action)"
        }
    }
    
    
    
    func get_current_text() -> String {
        return current_text
    }
    
    // rather than handling it like this, which requires ViewController to know the contents of a ChoiceNode
    //func get_current_choice() -> ChoiceNode {
    //    return current_choice
    //}
    
    
    
    // handle each action separately
    func get_left_choice() -> String {
        return current_choice.leftChoice
    }
    
    
    
    func get_right_choice() -> String {
        return current_choice.rightChoice
    }

}
