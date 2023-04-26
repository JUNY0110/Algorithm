//
//  25304.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/23.
//

import Foundation

let totalCost = Int(readLine()!)!
let totalProductKind = Int(readLine()!)!
var sumCost = 0
var sumProductKind = 0

for _ in 0..<totalProductKind {
    let product = readLine()!.split(separator: " ").map { Int($0)! }
    if product[1] > 0 {
        sumCost += product[0] * product[1]
        sumProductKind += 1
    }
}

if (totalCost == sumCost) && (sumProductKind == totalProductKind) {
    print("Yes")
} else {
    print("No")
}
