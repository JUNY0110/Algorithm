//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/27.
//

import Foundation

let input = Int(String(readLine()!))!

for i in 1...input {
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
    print("Case #\(i): \(array[0] + array[1])")
}
