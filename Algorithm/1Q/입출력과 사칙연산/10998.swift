//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/21.
//

import Foundation

let multiplication = readLine()!.split(separator: " ").map {Int($0)!}
print(multiplication[0] * multiplication[1])
