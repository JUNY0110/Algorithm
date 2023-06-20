//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/20.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let number = Int(readLine()!)!
        let limit = Int(readLine()!)!
        let power = Int(readLine()!)!
        print(solution1(number, limit, power))
    }
    
    func solution1(_ number:Int, _ limit:Int, _ power:Int) -> Int {
        var weapons = Array(repeating: 0, count: number + 1) // 기사 무기 공격력
        
        for n in 1...number {
            var divisor = n // 약수
            
            while divisor <= number {
                weapons[divisor] += 1 // 약수 갯수 추가
                divisor += n // 에라토스테네스의 체 응용. n의 배수 체크
            }
        }
        
        weapons = weapons.map { $0 > limit ? power : $0 }
        
        return weapons.reduce(0, +)
    }
    
    func solution2(_ number:Int, _ limit:Int, _ power:Int) -> Int {
        // number == 기사들의 고유번호
        // 고유번호의 약수 갯수 == 기사 무기의 공격력 -> 단, limit보다 크면 power로 대체.
        var nights = [Int:Int]() // 기사번호, 기사 무기 공격력
        var steelWeight = 0

        for n in 1...number {
            let weaponPower = checkDivisor(of: n)

            nights[n] = (weaponPower > limit) ? power : weaponPower
            steelWeight += nights[n]!
        }

        return steelWeight
    }

    func checkDivisor(of num: Int) -> Int {
        let squareRoot = Int(Double(num).squareRoot())
        var divisor = 0

        for n in 1...squareRoot where num % n == 0 {
            divisor += 1
        }
        
        if squareRoot * squareRoot == num {
            return (divisor * 2) - 1
        }
        return divisor * 2
    }
}
