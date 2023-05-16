//
//  7785.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/16.
//

import Foundation

class BaekJoon7785 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 회사에 있는 직원 찾기
    /// - IMPORTANT: Set을 활용하는 문제.
    
    func solution() {
        let num = Int(readLine() ?? "1") ?? 1
        var company = Set<String>()
        
        for _ in 0..<num {
            let info = readLine()!.split(separator: " ").map { String($0) }
            
            if info[1] == "enter" {
                company.insert(info[0])
            } else {
                company.remove(info[0])
            }
        }
        
        company.sorted(by: >).forEach {
            print($0)
        }
    }
}
