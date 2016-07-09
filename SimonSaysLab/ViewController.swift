//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0
    
    @IBAction func blueButtonTapped(sender: AnyObject) {
        print("Blue tapped")
        // The print really helped because initially I wasn't sure if the button was actually getting pressed. In a real world application I would try to animate the buttons when they're tapped.
        simonSaysGame.guessBlue()
        buttonsClicked += 1
        // I was initially using buttonsClicked + 1 but I realized that was just adding 1 to 0, but making it += it will continue to add on top to eventually find out if 5 buttons were clicked (5 is the amount requested from the Simon pattern). Also note that buttonsClicked++ doesn't work here either. It will be removed Swift 3
        playerWon()
    
    }
    
    @IBAction func redButtonTapped(sender: AnyObject) {
        print("Red tapped")
        simonSaysGame.guessRed()
        buttonsClicked += 1
        playerWon()
    }
    
    @IBAction func greenButtonTapped(sender: AnyObject) {
        print("Green tapped")
        simonSaysGame.guessGreen()
        buttonsClicked += 1
        playerWon()
    }
    
    @IBAction func yellowButtonTapped(sender: AnyObject) {
        print("Yellow tapped")
        simonSaysGame.guessYellow()
        buttonsClicked += 1
        playerWon()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winLabel.hidden = true
    }
    
    func playerWon () {
        // This is my helper function I created to display the correct winLabel since I otherwise would have had to write all of this in each "buttonTapped" function
        
        if buttonsClicked == 5 && simonSaysGame.wonGame() {
            winLabel.hidden = false
            winLabel.text = "Simon: You won!"
        }
        
        if buttonsClicked == 5 && !simonSaysGame.wonGame() {
            winLabel.hidden = false
            winLabel.text = "Simon: You lost!"
        }
    }
}

// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
}
