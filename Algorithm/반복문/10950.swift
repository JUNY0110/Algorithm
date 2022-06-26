//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/26.
//

import Foundation

let input = Int(String(readLine()!))!

for _ in 1...input {
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
    print(array[0] + array[1])
}

