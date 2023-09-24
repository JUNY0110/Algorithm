//
//  2747.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon2747 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numberth = Int(readLine()!)!
        var array = [0, 1]
        
        for i in 1..<numberth {
            array.append(array[i-1] + array[i])
        }
        print(array.last!)
    }
}
