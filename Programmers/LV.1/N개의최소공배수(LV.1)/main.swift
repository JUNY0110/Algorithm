//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/05.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution1(arr))
    }
    
    // 2 6 8 14 -> 168
    // 1 2 3 -> 6
    
    func solution1(_ arr:[Int]) -> Int {
        return arr.reduce(1) { lcm(of: $0, $1) }
    }

    func lcm(of a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(of: a, b)
    }

    func gcd(of a: Int, _ b: Int) -> Int {
        let mod = a % b
        return mod == 0 ? b : gcd(of: b, mod)
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func solution2(_ arr:[Int]) -> Int {
        // (소수 판별을 위한) 임의의 수 생성
        // 임의의 수가 소수인지 확인
        // 배열 요소별로 임의의 수로 나눈 나머지가 0일 때,
        // 임의의 수로 모든 배열을 나누고
        // 다시 임의의 수로 나눠지는지 확인
        // 안 나눠지면 다음 수 확인

        // 수의 범위가 좁기 때문에 에라토스테네스의 체는 하지 않음

        var arr = arr
        var lcm = arr[0]
        // arr갯수가 2개 이상일 때임. 1개일때는 별도로 계산
        if arr.count > 0 {
            for i in 1..<arr.count {
               lcm = findLcm(&lcm, &arr[i])
            }
        }

        return lcm
    }

    func findLcm(_ a: inout Int, _ b: inout Int) -> Int {
        var i = 2
        var gcd = 1

        while i <= min(a,b) {
            if a % i == 0 && b % i == 0 {
                a /= i
                b /= i
                gcd *= i
            } else {
                i += 1
            }
        }
        return gcd * a * b
    }
}
