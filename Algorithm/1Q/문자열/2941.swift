//
//  2941.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/04.
//

import Foundation

class BaekJoon2941 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let input = readLine()!
        let inputArray = input.map{String($0)}
        var alphabetCount = 0
        
        for i in 0..<inputArray.count {
            alphabetCount += 1
            
            if i >= 2 && inputArray[i-2] + inputArray[i-1] + inputArray[i] == "dz=" {
                alphabetCount -= 2
            } else if i >= 1 {
                let croatiaAlphabet = inputArray[i-1] + inputArray[i]
                if croatiaAlphabet == "c=" || croatiaAlphabet == "c-" ||
                    croatiaAlphabet == "d-" ||
                    croatiaAlphabet == "lj" || croatiaAlphabet == "nj" ||
                    croatiaAlphabet == "s=" || croatiaAlphabet ==  "z=" {
                    alphabetCount -= 1
                }
            }
        }
        print(alphabetCount)
    }
    
    func solution2() {
        if var input = readLine() {
            let croatiaAlphabet = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
            
            for i in 0..<croatiaAlphabet.count {
                input = input.replacingOccurrences(of: croatiaAlphabet[i], with: "!")
            }
            print(input.count)
        }
    }
}
