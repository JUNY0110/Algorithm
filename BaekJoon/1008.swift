//
//  1008.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/22.
//

import Foundation

let division = readLine()!.split(separator: " ").map{Int($0)!}
print(Double(division[0])/Double(division[1]))

let division = readLine()!.split(separator: " ").map{Double($0)!}
print(division[0]/division[1])

