//
//  10951.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/24.
//

import Foundation


// EOF를 이해해야 하는 문제.
// while을 어떻게 끝낼 것인가?

while let line = readLine() {
    if line.isEmpty {
        break
    }
    let inputLine = line.split(separator: " ").map { Int($0)! }
    print(inputLine[0] + inputLine[1])
}
