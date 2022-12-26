//
//  10818.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

if let input = readLine(),
   let valueAmount = Int(input) {
    let valueArray = readLine()!.split(separator: " ").map { Int($0)! }
    
    if valueArray.count == valueAmount {
        print(valueArray.min()!, valueArray.max()!)
    }
}
