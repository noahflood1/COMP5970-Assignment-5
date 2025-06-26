//
//  Untitled.swift
//  MyAdventure
//
//  Created by Noah Flood on 6/25/25.
//

import Foundation

class ChoiceNode {
    
    init(_ leftChoice: String, _ rightChoice: String, _ leftNext: ChoiceNode!, _ rightNext: ChoiceNode!, _ is_end: Bool = false) { // not sure why, but you don't initalize the next ones here.
        self.leftChoice = leftChoice
        self.rightChoice = rightChoice
        self.leftNext = leftNext
        self.rightNext = rightNext
        self.is_end = is_end
    }
        
    var leftChoice: String
    var rightChoice: String
    
    var leftNext: ChoiceNode?
    var rightNext: ChoiceNode?
    
    var is_end: Bool
}
