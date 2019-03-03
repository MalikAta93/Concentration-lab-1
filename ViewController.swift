//
//  ViewController.swift
//  Concentration
//
//  Created by Malik Ata on 2/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

private lazy var game = Concentration(
    numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int{
    return (cardButtons.count+1) / 2
        
    }
    
   
  

    //label for the how mnay flips
    @IBOutlet weak var flipCountLabel: UILabel!
    
    //label for the scoreboard
    @IBOutlet weak var scoreCountLabel: UILabel!


    
    //array of cards
    @IBOutlet private var cardButtons: [UIButton]!


    //BUtton Function that once clicked resets the game to the initial state
    @IBAction func newGame() {
        game.resetGame()
        updateViewFromModel()
        
        //add new emojis to the cards
        RandomSelection()
    }

    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at:
                cardNumber)
            updateViewFromModel()
          
            
        } else{
            
            print("Chosen Card was not in Cardbutton")
            
        }
        
        
    }
    
    

    private func updateViewFromModel() {
        
          for index in cardButtons.indices {
               let button = cardButtons[index]
               let card = game.cards[index]
            if card.isFaceUp {
               
                button.setTitle(emoji(for: card),
        for: UIControlState.normal)
        button.backgroundColor =  #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    } else {
        button.setTitle("", for: UIControlState.normal)
        button.backgroundColor = card.isMatched ?   #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 0) :   #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                
            }
            

        }
        scoreCountLabel.text = "Win : \(game.scoreBoard)"
  
        flipCountLabel.text = "Flips: \(game.flipCount)"
        
    }
    
    

    
    
    //5 different themes of emjojis
 
    private let themes = [
         ["😆","😛","😱","😈","👹","🤧","😴","🤠","😘","🤡","😍","😇","😨","😜"],
         ["🌮","🍅","🍠","🍍","🍘","🥜","🥙","🌭","🍔","🍋","🍍","🍟","🍎","🥖"],
         ["🐢","🐔","🐽","🦀","🐬","🦆","🐃","🦑","🐐","🦍","🐭","🐂","🐳","🐙"],
         ["૱","₮","₣","௹","₳","₲","₵","₡","₰","₧","₯","₶","₠","฿"],
         ["♟","♧","☇","☾","☁︎","♖","✃","⚓︎","♐︎","♎︎","☿","✒︎","♂","♄"],
         ["🏸","🏏","🥊","🤺","🏉","🎱","⚾️","🏈","🏀","🏐","🎾","⚽️","⛸","🏑"]
        ]
    
    
    private var emojiChoices: [String] = []

    //one line of code to randomize the card emojis
    private func RandomSelection() {
       return emojiChoices = themes[themes.count.arc4random]
    }
    
    
    
 
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}




extension Int{
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
            
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))} else
        {
            return 0
            
        }
        
    }
    
}

    
    
    


