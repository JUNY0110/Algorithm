//
//  1181.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/21.
//

import Foundation

class BaekJoon1181 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let n = Int(readLine()!)!
        var alphaSet = Set<String>()
        var alphaArray = Array<String>()
        
        for _ in 0..<n {
            let alpha = readLine()!
            alphaSet.insert(alpha)
        }
        alphaArray = alphaSet.sorted(by: {$0.count == $1.count ? $0 < $1 : $0.count < $1.count})
        
        print(alphaArray.map{$0}.joined(separator: "\n"))
    }
    
    func solution2() {
        let n = Int(readLine()!)!
        var alphaSet = Set<String>()
        var alphaArray = [(Int, String)]()
        
        for _ in 0..<n {
            let alpha = readLine()!
            if alphaSet.insert(alpha).inserted {
                alphaArray.append((alpha.count, alpha))
            }
        }
        alphaArray.sorted(by: <).forEach {
            print($0.1)
        }
    }
}
