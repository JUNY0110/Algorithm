//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/23.
//

import Foundation

let input = readLine()
let array = input!.split(separator: " ")

let leap = Int(array[0])!

if leap % 4 == 0 && leap % 100 != 0 || leap % 400 == 0 {
    print(1)
} else {
    print(0)
}
