//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/24.
//

import Foundation


let inputA = readLine()!
let inputB = readLine()!

let a = Int(inputA)!
let b = Int(inputB)!

if a > 0 {
    if b > 0 {
        print(1)
    } else if b < 0 {
        print(4)
    }
} else if a < 0 {
    if b > 0 {
        print(2)
    } else if b < 0 {
        print(3)
    }
}


if a > 0, b > 0 {
    print(1)
} else if a < 0, b > 0 {
    print(2)
} else if a < 0, b < 0 {
    print(3)
} else if a > 0, b < 0 {
    print(4)
}
