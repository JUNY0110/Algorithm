//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/24.
//

import Foundation

let input = readLine()!.split(separator: " ")

var hh = Int(input[0])!
var mm = Int(input[1])!

mm -= 45
if mm < 0 {
    hh -= 1
    mm = 60 - (-mm)
}
if hh == 0 {
    hh = 23
}

print("\(hh)")
print("\(mm)")


mm -= 45
if mm < 0 {
    hh -= 1
    mm = 60 - (-mm)
}
if hh < 0 {
    hh = 24 - (-hh)
}

print("\(hh)")
print("\(mm)")
