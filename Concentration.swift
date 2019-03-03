//
//  Concentration.swift
//  Concentration
//
//  Created by Malik Ata on 2/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    //variable for the score that is matched or unmatched
    private(set) var scoreBoard = 0


    private struct Points {
        static let matchBonus = 1
        static let missMatchPenalty = 1
    }
    
    //keep track of how many flips occured
    private(set) var flipCount = 0
    
    
    private(set) var cardLooked: Set<Int> = []
    
    
  
    
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                if foundIndex == nil {
                    foundIndex = index
                    
                } else {
                    return nil
                    
                 }
                }
               }
            return foundIndex
            
        }
        set{
            for index in cards.indices{
    
                cards[index].isFaceUp = (index == newValue)
                
                
                }}}
    
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    //cards match
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                    // Increase the score
                    scoreBoard += Points.matchBonus
                } else {
                    
                    
                   
                    if cardLooked.contains(matchIndex) {
                        scoreBoard -= Points.missMatchPenalty
                    }
                    cardLooked.insert(index)
                    cardLooked.insert(matchIndex)
                }
                cards[index].isFaceUp = true
                
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    
    
    //function to reset the game to the intial state
    func resetGame (){
        
        //after the game resets, shuffle the cards
        shuffleTheCards()
        
        //set the cardLooked, flipount, and the score booard of the game to zero
        cardLooked = []; flipCount = 0 ; scoreBoard = 0 
        
        //set the cards all to false for faceup
        for index in cards.indices  {
            cards[index].isFaceUp = false
            
            cards[index].isMatched = false
        }
        
        
        
        
        
       
        
    }
    
    
        init (numberOfPairsOfCards: Int) {
assert(numberOfPairsOfCards > 0,
"Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
            for _ in 1...numberOfPairsOfCards{
                let card =  Card()
                cards += [card , card]
            }
           
           shuffleTheCards()
        }
   
    
    //to do
    
    // function to shuffle the cards
     private func shuffleTheCards() {
        
        //for all the cards all 26
        for _ in 0..<cards.count {

            
        //used sort method instead od swap
            
            
    cards.sort(by: {_,_ in arc4random() > arc4random()})
        }
    }
    
}
