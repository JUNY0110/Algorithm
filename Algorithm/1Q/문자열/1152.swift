//
//  1152.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/03.
//

import Foundation

class BaekJoon1152 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let sentence = readLine()!.split(separator: " ").map{ String($0) }
        print(sentence.count)
    }
    
    func solution2() {
        print(readLine()!.split(separator: " ").map{ String($0) }.count)
    }
}
