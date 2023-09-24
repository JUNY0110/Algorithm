//
//  1550.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon1550 {
    func run() {
        solution2()
    }
    
    enum Hexademical: String {
        case zero = "0"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "A"
        case eleven = "B"
        case twelve = "C"
        case thirteen = "D"
        case fourteen = "E"
        case fifteen = "F"
        
        var convertToDecimal: Int {
            switch self {
            case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine: return Int(self.rawValue)!
            case .ten: return 10
            case .eleven: return 11
            case .twelve: return 12
            case .thirteen: return 13
            case .fourteen: return 14
            case .fifteen: return 15
            }
        }
    }
    
    private func solution1() {
        let hexademical = readLine()!.reversed().map { $0.hexDigitValue }
        var result = 0
        
        for i in 0..<hexademical.count {
            result += hexademical[i]! * Int(pow(16, Double(i)))
        }
        
        print(result)
    }
    
    private func solution2() {
        print(Int(readLine()!, radix: 16)!)
    }
}
