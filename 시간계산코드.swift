//
//  시간계산코드.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/26.
//

import Foundation
let startTime = CFAbsoluteTimeGetCurrent()
var n = Int(String(readLine()!))!

for i in stride(from: n, to: 0, by: -1) {
    print("\(i)")
}
print(CFAbsoluteTimeGetCurrent() - startTime)
