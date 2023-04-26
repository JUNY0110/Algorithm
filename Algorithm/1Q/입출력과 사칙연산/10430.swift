//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/22.
//

import Foundation

// (A+B)%C는 ((A%C) + (B%C))%C 와 같을까?

// (A×B)%C는 ((A%C) × (B%C))%C 와 같을까?

// 세 수 A, B, C가 주어졌을 때, 위의 네 가지 값을 구하는 프로그램을 작성하시오.

// 첫째 줄에 A, B, C가 순서대로 주어진다. (2 ≤ A, B, C ≤ 10000)

// 첫째 줄에 (A+B)%C, 둘째 줄에 ((A%C) + (B%C))%C, 셋째 줄에 (A×B)%C, 넷째 줄에 ((A%C) × (B%C))%C를 출력한다.


//let input = readLine()
//let array = input!.split(separator: " ")
//let a = Int(array[0])!
//let b = Int(array[1])!
//let c = Int(array[2])!

let numbers = readLine()!.split(separator: " ").map{Int($0)!}
let a = numbers[0]
let b = numbers[1]
let c = numbers[2]

print( (a + b) % c)
print( ((a % c) + (b % c)) % c)
print( (a * b) % c)
print( ((a % c) * (b % c)) % c )

