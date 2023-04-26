//
//  2752.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon2752 {
    func run() {
        solution()
    }
    
    func solution() {
        print(readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <).map {"\($0)"}.joined(separator: " "))
    }
}
