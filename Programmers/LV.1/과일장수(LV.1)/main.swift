//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/11.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let k = Int(readLine()!)!
        let m = Int(readLine()!)!
        let score = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(k, m, score))
    }

    func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
        let score = score.sorted(by: >)
        var sum = 0

        for i in stride(from: 0, to: score.count, by: m) {
            if i+m <= score.count {
                let appleBox = Array(score[i..<i+m])
                sum += appleBox.last! * m
            }
        }

        return sum
    }
}
