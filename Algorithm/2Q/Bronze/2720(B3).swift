//
//  2720.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/01.
//

import Foundation

class BaekJoon2720 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 거스름돈 단위별 개수 구하기
    /// - IMPORTANT: 기준값을 단위별 나누거나 나머지 값을 이용해 갯수 구하기. 
    
    func solution1() {
        let num = Int(readLine()!)!
        
        for _ in 0..<num {
            let money = Int(readLine()!)!,
                quarter = money / 25,
                dime = (money % 25) / 10,
                nickel = ((money % 25) % 10) / 5,
                penny = ((money % 25) % 10) % 5
            
            print(quarter, dime, nickel, penny)
        }
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        let quarter = 25, dime = 10, nickel = 5, penny = 1
        
        for _ in 0..<num {
            var results = [Int]()
            
            changedMoney(change: quarter)
            changedMoney(change: dime)
            changedMoney(change: nickel)
            changedMoney(change: penny)
            
            func changedMoney(change: Int) {
                var money = Int(readLine()!)!
                
                if money >= change {
                    results.append(money / change)
                    money -= change * Int(money / change)
                } else {
                    results.append(0)
                }
            }

            print(results.map { String($0) }.joined(separator: " "))
        }
    }
}
