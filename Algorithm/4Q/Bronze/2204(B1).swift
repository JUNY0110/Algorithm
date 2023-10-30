//
//  2204.swift
//  Algorithm
//
//  Created by 지준용 on 10/29/23.
//

import Foundation


final class BaekJoon2204 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        while let input = readLine(),
              let n = Int(input), n != 0 {
            var wordDict = [String: String]()
            
            for _ in 0..<n {
                let word = readLine()!
                wordDict[word.lowercased()] = word
            }
            
            let result = wordDict.sorted(by: {$0.key < $1.key})
            print(result[0].value)
        }
    }
    
    private func solution2() {
        while let input = readLine(),
              let n = Int(input), n != 0 {
            var words = Array(repeating: "", count: n)
            
            for i in 0..<n {
                let word = readLine()!
                words[i] = word
            }
            
            words.sort(by: {$0.lowercased() < $1.lowercased()})
            print(words[0])
        }
    }
}
