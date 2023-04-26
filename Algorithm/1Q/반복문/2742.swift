//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/27.
//

import Foundation

var n = Int(String(readLine()!))!

for i in stride(from: n, to: 0, by: -1) {
    print("\(i)")
}

for i in (1...n).reversed() {
    print("\(i)")
}
//reversed가 stride보다 3배 느리다.
