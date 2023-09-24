//
//  2902.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon2902 {
    func run() {
        solution()
    }
    
    private func solution() {
        let names = readLine()!.split(separator: "-").map { String($0) }
        var result = ""
        
        for name in names {
            result += String(name.first!)
        }
        print(result)
    }
}
