//
//  11365.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon11365 {
    func run() {
        solution1()
    }
    
    func solution1() {
        while let input = readLine(), input != "END" { print(String(input.reversed())) }
    }
}
