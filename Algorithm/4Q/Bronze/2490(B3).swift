//
//  2490.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/23.
//

import Foundation


class BaekJoon2490 {
    enum Yutnori: Int, CustomStringConvertible {
        case doe = 3
        case gae = 2
        case geol = 1
        case yut = 0
        case mo = 4
        
        var description: String {
            switch self {
            case .doe: return "A"
            case .gae: return "B"
            case .geol: return "C"
            case .yut: return "D"
            case .mo: return "E"
            }
        }
    }
    
    func run() {
        solution()
    }
    
    private func solution() {
        for _ in 0..<3 {
            let yut = readLine()!.split(separator: " ").map { Int(String($0))! }
            guard let result = Yutnori(rawValue: yut.reduce(0, +)) else { continue }
            
            print(result)
        }
    }
}
