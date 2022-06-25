//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/24.
//

import Foundation

let inputH = readLine()!
//let inputM = readLine()!
let inputArrayH = inputH.split(separator: " ")
let inputArrayM = inputH.split(separator: " ")

var hh = Int(inputArrayH[0])!
var mm = Int(inputArrayM[1])!

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
