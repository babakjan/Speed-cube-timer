//
//  Solve.swift
//  SpeedCubingTimer
//
//  Created by Jan Babák on 16.03.2023.
//

import SwiftUI

struct Solve: Identifiable {
    var scramble = ""
    var date = Date()
    var hours = 0
    var minutes = 0
    var seconds = 0
    var fractions = 0
    var penalty: SolvePenalty = .noPenalty
    var id = UUID().uuidString
    
    // format time including the penalty
    var formattedTime: String {
        if penalty == .DNF {
            return "DNF"
        }
        
        var secondsOut = seconds
        var minutesOut = minutes
        var hoursOut = hours
        
        if penalty == .plus2 {
            secondsOut += 2
        }
        
        if secondsOut > 59 {
            minutesOut += secondsOut / 60
            secondsOut %= 60
        }
        
        if minutesOut > 59 {
            hoursOut += minutesOut / 60
            minutesOut %= 60
        }
        
        if hoursOut == 0 {
            if minutesOut == 0 {
                return String(format: "%02d.%02d", secondsOut, fractions)
            } else {
                return String(format: "%02d:%02d.%02d", minutesOut, secondsOut, fractions)
            }
        }
        return String(format: "%02d:%02d:%02d.%02d", hoursOut, minutesOut, secondsOut, fractions)
    }
}

enum SolvePenalty: String {
    case noPenalty = "no penalty"
    case plus2 = "+2" //+ 2 seconds
    case DNF = "DNF" //Did Not Finished
}
