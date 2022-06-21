//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/21.
//

import Foundation

let input = readLine()
let inputArray = input!.split(separator: " ")
let a = Int(inputArray[0])!
let b = Int(inputArray[1])!

print(a-b)


let minusinput = readLine()!.split(separator: " ").map {Int($0)!}
print(minusinput[0]-minusinput[1])
