//
//  SessionModel.swift
//  HIIM
//
//  Created by Ethan Petuchowski on 4/14/15.
//  Copyright (c) 2015 Ethan Petuchowski. All rights reserved.
//

import Foundation
class SessionModel {
    
    let INCREMENT_SIZE = 1.1

    // properties
    var intervalLength = 15
    var successesInARow = 0
    var numSuccesses = 0
    var successfulSeconds = 0
    var numFailures = 0
    var failingSeconds = 0
    var intervalsCompleted = 0
    
    func totalTime() -> Int {
        return successfulSeconds + failingSeconds
    }
    
    func success() {
        intervalsCompleted++
        numSuccesses++
        successfulSeconds += intervalLength
        intervalLength = Int(Double(intervalLength) * INCREMENT_SIZE)
        successesInARow++
    }
    
    func unsuccess(i: Int) {
        numFailures++
        failingSeconds += i
        intervalLength = Int(Double(intervalLength) / INCREMENT_SIZE)
        successesInARow = 0
    }
    
    func unsuccess() {
        intervalsCompleted++
        unsuccess(intervalLength)
    }
    
    init() {
    }
}