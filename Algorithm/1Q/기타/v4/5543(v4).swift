//
//  5543.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon5543 {
    func run() {
        solution2()
    }
    
    func solution1() {
        var burgers = [Int]()
        var beverages = [Int]()

        for _ in 0..<3 { burgers.append(Int(readLine()!)!) }
        for _ in 0..<2 { beverages.append(Int(readLine()!)!) }

        print(burgers.min()! + beverages.min()! - 50)
    }
    
    func solution2() {
        var burgers = [Int]()
        var beverages = [Int]()

        for _ in 0..<3 { burgers.append(Int(readLine()!)!) }
        for _ in 0..<2 { beverages.append(Int(readLine()!)!) }

        print(burgers.sorted(by: <)[0] + beverages.sorted(by: <)[0] - 50)
    }
}
