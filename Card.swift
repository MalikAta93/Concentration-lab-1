//
//  Card.swift
//  Concentration
//
//  Created by Malik AtaUsing the word Final allows you to finally allow a property, method, or subscript to be overridden. 

//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    private static var identifierFactory = 0;
    
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    init() {
self.identifier = Card.getUniqueIdentifier()
    }
}
