//
//  ViewController.swift
//  HIIM
//
//  Created by Ethan Petuchowski on 4/14/15.
//  Copyright (c) 2015 Ethan Petuchowski. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var summaryText: UITextView!
    
    @IBOutlet var intervalsCompleted: UILabel!
    @IBOutlet var successesInARow: UILabel!
    @IBOutlet var successfulSeconds: UILabel!
    @IBOutlet var failingSeconds: UILabel!
    @IBOutlet var numberOfSuccesses: UILabel!
    @IBOutlet var intervalLength: UILabel!
    
    var session = SessionModel()
    let EVERY_SECOND: Double = 1
    var bellSound = NSURL(fileURLWithPath:
        NSBundle.mainBundle().pathForResource("Bell", ofType: "m4a")!)
    
    var audioPlayer = AVAudioPlayer()
    var timer = NSTimer()
    
    var counter: Int = 0
    var successActive = false
    
    func playSound() {
        audioPlayer.stop()
        audioPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: bellSound, error: nil)
        audioPlayer.prepareToPlay()
    }

    @IBAction func startSession(sender: AnyObject) {
        session = SessionModel()
        summaryText.text = ""
        startInterval()
    }
    
    @IBAction func endSession(sender: AnyObject) {
        intervalEnded()
        displayFinalSummary()
        timerLabel.text = "The Timer"
    }
    
    func displayFinalSummary() {
        summaryText.text = "Your session lasted \(session.totalTime() + counter) seconds"
    }
    
    func updateSessionStatsDisplay() {
        intervalsCompleted.text = "Intervals Completed: \(session.intervalsCompleted)"
        successesInARow.text    = "Successes in a row: \(session.successesInARow)"
        successfulSeconds.text  = "Successful Seconds: \(session.successfulSeconds)"
        failingSeconds.text     = "Failing Seconds: \(session.failingSeconds)"
        numberOfSuccesses.text  = "Number of Successes: \(session.numSuccesses)"
        intervalLength.text = "Interval Length: \(session.intervalLength)"
    }
    
    
    @IBAction func succeeded(sender: AnyObject) {
        if (!successActive) {
            return
        }
        session.success()
        startInterval()
    }
    
    @IBAction func unsucceeded(sender: AnyObject) {
        if (counter == 0) {
            return
        }
        session.unsuccess(counter)
        startInterval()
    }
    
    func startInterval() {
        successActive = false
        updateSessionStatsDisplay()
        counter = 0
        playSound()
        timerLabel.text = String(counter)
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(
            EVERY_SECOND,
            target: self,
            selector: Selector("tick"),
            userInfo: nil,
            repeats: true
        )
        
    }
    
    func intervalEnded() {
        playSound()
        timer.invalidate()
        successActive = true
    }
    
    func tick() {
        timerLabel.text = String(++counter)
        if (counter >= session.intervalLength) {
            intervalEnded()
        }
    }
}

