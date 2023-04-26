//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/25.
//

import Foundation

var input = Int(String(readLine()!))!
var number: Int = 1

while number <= 9 {
    print("\(input) * \(number) = \(input * number)")
    number += 1
}
