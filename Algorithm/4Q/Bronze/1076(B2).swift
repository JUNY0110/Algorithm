//
//  1076.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/25.
//

import Foundation

class BaekJoon1076 {
    func run() {
        solution()
    }
    
    enum Resistance: String, CustomStringConvertible {
        case black = "black"
        case brown = "brown"
        case red = "red"
        case orange = "orange"
        case yellow = "yellow"
        case green = "green"
        case blue = "blue"
        case violet = "violet"
        case grey = "grey"
        case white = "white"
        
        var description: String {
            switch self {
            case .black: return "0"
            case .brown: return "1"
            case .red: return "2"
            case .orange: return "3"
            case .yellow: return "4"
            case .green: return "5"
            case .blue: return "6"
            case .violet: return "7"
            case .grey: return "8"
            case .white: return "9"
            }
        }
        
        var multiple: Int {
            switch self {
            case .black: return 1
            case .brown: return 10
            case .red: return 100
            case .orange: return 1000
            case .yellow: return 10000
            case .green: return 100000
            case .blue: return 1000000
            case .violet: return 10000000
            case .grey: return 100000000
            case .white: return 1000000000
            }
        }
    }
    
    private func solution() {
        var value = ""
        var result = 0
        
        for i in 0..<3 {
            let color = readLine()!
            guard let resistance = Resistance(rawValue: color) else { return }
            
            if i < 2 {
                value += String(reflecting: resistance)
                continue
            }
            result = Int(value)! * resistance.multiple
        }
        print(result)
    }
}
