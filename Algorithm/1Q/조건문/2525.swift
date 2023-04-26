//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/25.
//

import Foundation

let array = readLine()!.split(separator: " ")

var hh = Int(array[0])!
var mm = Int(array[1])!
let addTime = Int(readLine()!)!

mm += addTime
if mm >= 60 {
    hh += (mm / 60)
    mm = (mm % 60)
    
    if hh >= 24 {
        hh -= 24
    }
    
}

print(hh)
print(mm)
