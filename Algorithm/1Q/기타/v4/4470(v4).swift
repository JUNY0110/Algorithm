//
//  4470.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon4470 {
    func run() {
        solution()
    }
    
    func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            let input = readLine()!
            print("\(i). \(input)")
        }
    }
}
