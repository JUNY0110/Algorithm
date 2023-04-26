//
//  20499.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon20499 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let kda = readLine()!.split(separator: "/").map{Int(String($0))!}
        print(kda[0] + kda[2] < kda[1] || kda[1] == 0 ? "hasu" : "gosu")
    }
}
