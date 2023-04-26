//
//  10156.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon10156 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let moneys = readLine()!.split(separator: " ").map{Int(String($0))!}
        print(moneys[0] * moneys[1] - moneys[2] < 0 ? 0 : moneys[0] * moneys[1] - moneys[2] )
    }
    
    func solution2() {
        let moneys = readLine()!.split(separator: " ").map{Int(String($0))!}

        if moneys[0] * moneys[1] - moneys[2] < 0 { print(0) }
        else { print(moneys[0] * moneys[1] - moneys[2]) }
    }
}
