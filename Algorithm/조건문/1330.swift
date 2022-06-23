//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/23.
//

import Foundation

let a = readLine()!.split(separator: " ").map{Int($0)!}

if a[0] > a[1] {
    print(">")
} else if a[0] < a[1] {
    print("<")
} else if a[0] == a[1] {
    print("==")
}

//if 5 == 5 {
// print("==")
//}
//
