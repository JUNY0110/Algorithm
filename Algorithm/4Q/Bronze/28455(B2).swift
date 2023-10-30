//
//  28455.swift
//  Algorithm
//
//  Created by 지준용 on 10/28/23.
//

import Foundation


final class BaekJoon28455 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        let abilityPlus = [0, 60, 100, 140, 200, 250]
        var myCharacters = Array(repeating: 0, count: n)
        var myAbilityPoint = 0
        var sumOfLevels = 0
        
        for i in 0..<n {
            let l = Int(readLine()!)!
            myCharacters[i] = l
        }
        myCharacters.sort(by: >)
        
        for i in 0..<n {
            if i >= 42 { break }
            
            let level = myCharacters[i]
            guard let abilityPoint = abilityPlus.lastIndex(where: {$0 <= level}) else { continue }
            sumOfLevels += level
            myAbilityPoint += abilityPoint
        }
        
        print(sumOfLevels, myAbilityPoint)
    }
}
