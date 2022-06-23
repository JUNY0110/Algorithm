//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/23.
//

import Foundation

let input = readLine()!
let array = input.split(separator: " ")

let score = Double(array[0])!

if score >= 90, score <= 100 {
    print("A")
} else if score >= 80 {
    print("B")
} else if score >= 70 {
    print("C")
} else if score >= 60 {
    print("D")
} else {
    print("F")
}

