//
//  1009.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon1009 {
    func run() {
        solution3()
    }
    
    // MARK: - 79512(kb) / 12(ms) / 318(B)
    func solution1() {
        let n = Int(readLine()!)!

        for _ in 0..<n {
            var ab = readLine()!.split(separator: " ").map { Int(String($0))! }

            ab[1] = ab[1] % 4

            if ab[1] == 0 {
                ab[1] = 4
            }

            print(Int(pow(Double(ab[0]), Double(ab[1]))) % 10 == 0 ?
                  10 : (Int(pow(Double(ab[0]), Double(ab[1]))) % 10))
        }
    }
    
    // MARK: - 79512(kb) / 16(ms) / 287(B)
    func solution2() {
        let n = Int(readLine()!)!

        for _ in 0..<n {
            var ab = readLine()!.split(separator: " ").map { Int(String($0))! }

            ab[1] = ab[1] % 4 + 4

            print(Int(pow(Double(ab[0]), Double(ab[1]))) % 10 == 0 ?
                  10 : (Int(pow(Double(ab[0]), Double(ab[1]))) % 10))
        }
    }
    
    // MARK: - 69104(kb) / 12(ms) / 298(B)
    func solution3() {
        let n = Int(readLine()!)!

        for _ in 0..<n {
            var ab = readLine()!.split(separator: " ").map { Int(String($0))! }

            ab[1] = ab[1] % 4

            if ab[1] == 0 { ab[1] = 4 }
            
            ab = Array(repeating: ab[0], count: ab[1])
            
            print(ab.reduce(1, *) % 10 == 0 ? 10 : ab.reduce(1, *) % 10)
        }
    }
    
    // MARK: - 69104(kb) / 12(ms) / 258(B)
    func solution4() {
        let n = Int(readLine()!)!

        for _ in 0..<n {
            var ab = readLine()!.split(separator: " ").map { Int(String($0))! }

            ab[1] = ab[1] % 4 + 4
            ab = Array(repeating: ab[0], count: ab[1])
            
            print(ab.reduce(1, *) % 10 == 0 ? 10 : ab.reduce(1, *) % 10)
        }
    }
}
// MARK:  3 -> 3 9 7 1 3
// MARK:  7 -> 7 9 3 1 7
// MARK:  9 -> 9 1 9 1 9
// MARK:  6 -> 6 6 6 6 6
// MARK:  2 -> 2 4 8 6 2
// MARK:  8 -> 8 4 2 6 8


