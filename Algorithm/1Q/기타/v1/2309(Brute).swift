//
//  2309.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

//import Foundation

class BaekJoon2309 {
    func run() {
        solution2()
    }
    
    func solution1() {
        var shortMen = [Int]()
        for _ in 1...9 { shortMen.append(Int(readLine()!)!) }
        
        let sum = shortMen.reduce(0, +)
        var tricksters = [[Int]]()
        
        for i in 0..<shortMen.count - 1 {
            for j in i + 1..<shortMen.count {
                if sum - (shortMen[i] + shortMen[j]) == 100 { tricksters.append([shortMen[i], shortMen[j]]) }
            }
        }
        
        for tricster in tricksters[0] { shortMen = shortMen.filter({$0 != tricster}) }

        print(shortMen.sorted().map{"\($0)"}.joined(separator: "\n"))
    }
    
    func solution2() {
        var shortMen = [Int]()
        for _ in 1...9 { shortMen.append(Int(readLine()!)!) }

        let sum = shortMen.reduce(0, +)

        outerLoop: for i in 0..<shortMen.count - 1 {
            for j in i + 1..<shortMen.count {
                if sum - (shortMen[i] + shortMen[j]) == 100 {
                    shortMen.remove(at: j)
                    shortMen.remove(at: i)
                    break outerLoop
                }
            }
        }
        print(shortMen.sorted().map{"\($0)"}.joined(separator: "\n"))
    }
}
