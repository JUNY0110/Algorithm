//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/21.
//

import Foundation

let input = readLine()
let lineArray = input!.split(separator: " ")
let a = Int(lineArray[0])!
let b = Int(lineArray[1])!

print(a+b)
 
print((readLine()?.split(separator: " ").map { Int($0)!}.reduce(0,+))!)
