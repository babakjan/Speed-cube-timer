//
//  Solve.swift
//  SpeedCubingTimer
//
//  Created by Jan Babák on 16.03.2023.
//

import Foundation

struct Solve: Identifiable, Hashable {
    var scramble = ""
    var date = Date()
    var hours: Int16 = 0
    var minutes: Int16 = 0
    var seconds: Int16 = 0
    var fractions: Int16 = 0
    var note = ""
    var penalty: Penalty = .noPenalty
    var id = UUID().uuidString
    
    // result time in seconds
    var inSeconds: Double {
        return Double(hours * 3600 + minutes * 60 + seconds + (penalty == .plus2 ? 2 : 0)) + Double(fractions) / 100.0
    }
    
    // format time including the penalty
    var formattedTime: String {
        if penalty == .DNF {
            return "DNF"
        }
        
        return TimeFormatters.formatTime(seconds: inSeconds)
    }
    
    enum Penalty: String, CaseIterable, Identifiable {
        case noPenalty = "no penalty"
        case plus2 = "+2" //+ 2 seconds
        case DNF = "DNF" //Did Not Finished
        
        var id: String {
            self.rawValue
        }
    }
}

