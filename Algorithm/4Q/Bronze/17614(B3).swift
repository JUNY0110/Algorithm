//
//  2578.swift
//  Algorithm
//
//  Created by 지준용 on 10/23/23.
//

import Foundation


final class BaekJoon17614 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        var clapping = 0
        
        for x in 1...num {
            clapping = game(x, clapping)
        }
        print(clapping)
        
        func game(_ x: Int, _ count: Int) -> Int {
            if x < 3 { return count }
            
            if x % 10 == 3 || x % 10 == 6 || x % 10 == 9 {
                return game(x/10, count + 1)
            }
            
            return game(x/10, count)
        }
    }
}
