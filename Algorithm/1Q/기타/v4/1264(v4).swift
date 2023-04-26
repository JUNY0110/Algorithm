//
//  1264.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon1264 {
    func run() {
        solution()
    }
    
    func solution() {
        let exit = "#"
        let vowel = ["a", "e", "o", "i", "u"]

        while true {
            let input = readLine()!.lowercased()
            var count = 0
            
            if input == exit { break }

            for i in input {
                if vowel.contains(where: {$0 == String(i)}) { count += 1 }
            }
            print(count)
        }
    }
}
