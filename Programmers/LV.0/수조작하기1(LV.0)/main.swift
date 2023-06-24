//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/24.
//

import Foundation

class Main {
    enum Control: Int {
        case w = 1
        case s = -1
        case d = 10
        case a = -10
        case unknown = 0
        
        static func toMove(_ direction: Character) -> Control {
            switch direction {
            case "w": return .w
            case "s": return .s
            case "d": return .d
            case "a": return .a
            default: return .unknown
            }
        }
    }

    func solution(_ n:Int, _ control:String) -> Int {
        var n = n
        
        for c in control {
            n += Control.toMove(c.lowercased()).rawValue
        }
        
        return n
    }
}
