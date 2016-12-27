//
//  ViewController.swift
//  BoutTime
//
//  Created by Chris Argonish on 12/27/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

class ViewController: UIViewController {

    // outlets
    @IBOutlet weak var eventOne: UILabel!
    @IBOutlet weak var eventTwo: UILabel!
    @IBOutlet weak var eventThree: UILabel!
    @IBOutlet weak var eventFour: UILabel!
    @IBOutlet weak var cardOneDownBtn: UIButton!
    @IBOutlet weak var cardTwoUpBtn: UIButton!
    @IBOutlet weak var cardTwoDownBtn: UIButton!
    @IBOutlet weak var cardThreeUpBtn: UIButton!
    @IBOutlet weak var cardThreeDownBtn: UIButton!
    @IBOutlet weak var cardFourUpBtn: UIButton!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var nextRoundBtn: UIButton!
    @IBOutlet weak var shakeToComplete: UILabel!
    @IBOutlet weak var currentRound: UILabel!


    // global variables
    var gameSound: AVAudioPlayer!
    var score = 0
    var roundKeeper = 1
    var allottedTime = 60
    var timer: Timer?
    var eventQuestions: [Events] = []
    var currentRound: [Events] = []
    var nextRound: [Events] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Starts Game
        showAlert("Place the Presidents in the order in which they served. The oldest at the top & the most recent at the bottom.")
    }
    
    //Shake motion code
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .motionShake {
            checkAnswer(Useranswer: currentRound)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "gameOver" {
            let svg = segue.destinationViewController as! EndGameController
            
            svg.endGameScore = "\(score)/6"
        }
    }
    
    // Get 24 random questions from the presidentsList Array located in the HistoricalEvent.swift file
    func startGame() {
        
        shuffle()
        for i in 0...23 {
            eventQuestions.append(endGame[i])
        }
        startRound()
    }
    
    func startRound() {
        // Starts a new round by selecting the first four questions from gameEvents
        currentRound.text = "Round: \(roundKeeper)"
        if roundKeeper == 7 {
            endGame()
            return
        }
        
        //Setting timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.startTimer), userInfo: nil, repeats: true)
        
        for i in 0...3 {
            currentRound.append(eventQuestions[i])
            //set the UITextView to each event
        }
        eventOne.text = currentRound[0].description
        eventTwo.text = currentRound[1].description
        eventThree.text = currentRound[2].description
        eventFour.text = currentRound[3].description
    }
    
    func resetCounterLabel(){
        //resets the timer to 60 after each round.
        allottedTime = 60
        countDown.text = "0:\(countDown)"
    }
    
    func startTimer() {
        //Kick off timer
        allottedTime -= 1
        countDown.text = "0:\(countDown)"
        
        if allottedTime < 10 {
            countDown.text = "0:0\(countDown)"
        }
        
        if allottedTime == 0 {
            timer!.invalidate()
            checkAnswer(Useranswer: currentRound)
        }
    }
    
    //This checks to see what button was pushed to determine what elements in the array need to be switched and then updates the lables
    @IBAction func upOrDown(sender: AnyObject) {
        switch sender.tag {
        case 1:
            swap(&currentRound[0], &currentRound[1])
        case 2:
            swap(&currentRound[1], &currentRound[0])
        case 3:
            swap(&currentRound[1], &currentRound[2])
        case 4:
            swap(&currentRound[2], &currentRound[1])
        case 5:
            swap(&currentRound[2], &currentRound[3])
        case 6:
            swap(&currentRound[3], &currentRound[2])
        default:
            print("defualt")
        }
        updateEventLables()
    }
    
    //Takes the users answer then shorts it. If the user answer matches the sorted answer, the user is awarded one point for each round.
    func checkAnswer(Useranswer: [Events]) {
        
        timer!.invalidate()
        resetCounterLabel()
        roundKeeper += 1
        //sort users answer. In short we are putting all the events in order
        let answer = Useranswer.sort{$0.date < $1.date}
        
        if currentRound == answer {
            // Add 1 point for given round
            gameScore += 1
            nextRoundBtn.setImage(UIImage(named: "next_round_success.png"), forState: UIControlState.Normal)
            playSound("CorrectDing.wav")
        } else {
            // Let the user know they are wrong! Wrong! WRONG!
            playSound("IncorrectBuzz.wav")
            nextRoundBtn.setImage(UIImage(named: "next_round_fail.png"), forState: UIControlState.Normal)
        }
        countDown = 60
        endRound()
        showNextRoundButton()
        
    }
    //Updates label text
    func updateEventLables() {
        
        eventOne.text = currentRound[0].description
        eventTwo.text = currentRound[1].description
        eventThree.text = currentRound[2].description
        eventFour.text = currentRound[3].description
    }
    
    //Shuffles the array so that each game is distinctive
    func shuffle() {
        
        nextGame = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(presidentsList) as! [HistoricalEvent]
        
    }
    
    //Remove the last 4 items from the current array that way we are never repeating the events
    func endRound() {
        
        gameEvents.removeRange(0...3)
        
    }
    
    //Displays nextRoundButton
    func showNextRoundButton() {
        
        nextRoundBtn.isHidden = false
        shakeToComplete.isHidden = true
    }
    
    // Kicks off the next round after the user taps the button
    @IBAction func nextRoundButtonPressed(sender: AnyObject) {
        
        nextRoundBtn.isHidden = true
        shakeToComplete.isHidden = false
        clearCurrentRound()
        startRound()
    }
    
    //Clear the current round array after which you will need to call startRound() to add the next events for the following round.
    func clearCurrentRound() {
        
        currentRound.removeAll()
    }
    
    //Calls check answer when user shakes the device
    func userShakesiPhone(){
        
        checkAnswer(currentRound)
    }
    
    //Plays soundEffects for correct or wrong answers by taking a string as a paramater we can pass in the sound we need.
    func playSound(file: String) {
        
        let path = Bundle.main.path(forResource: file, ofType:nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url as URL)
            gameSound = sound
            sound.play()
        } catch {
            print("File not found")
        }
    }
    
    // Game over! display user score
    func endGame() {
        
        roundKeeper = 0
        currentRound.text = "Round: \(roundKeeper)"
        self.performSegue(withIdentifier: "gameOver", sender: self)
    }
    
    // Alert is displayed at the begining of each round to notify the user of how to play the game.
    func showAlert(title: String, message: String? = nil, style: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: dismissAlert)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    //Dismisses the alert.
    func dismissAlert(sender: UIAlertAction) {
        startGame()
    }
}

