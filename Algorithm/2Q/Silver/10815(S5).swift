//
//  10815.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/13.
//

import Foundation

class BaekJoon10815 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 갖고있는 숫자카드가 다른 숫자카드에도 있는지 확인하기
    /// - IMPORTANT: Set.contains의 시간복잡도 = O(1) 또는  이분탐색
    /// 이분탐색: 찾으려는 값이 범위 안에 있는지 확인하는 방법이며, 재귀를 이용해 범위를 반복적으로 반으로 나누어 찾는 방법
    func solution1() {
        let _ = readLine()!
        let nCard = Set(readLine()!.split(separator: " ").map { $0 })
        let _ = readLine()!
        let mCard = readLine()!.split(separator: " ").map { $0 }
        var result = [String]()
        
        result = mCard.map{ nCard.contains($0) ? "1" : "0" }
        
        print(result.joined(separator: " "))
    }
    
    func solution2() {
        let n = Int(readLine()!)!
        let nCards = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
        let _ = Int(readLine()!)!
        let mCards = readLine()!.split(separator: " ").map { Int($0)! }
        var results = [String]()
        
        for card in mCards {
            if binarySearch(left: 0, right: n-1, number: card, nCards: nCards) {
                results.append("1")
            } else {
                results.append("0")
            }
        }
        print(results.joined(separator: " "))
        
        func binarySearch(left: Int, right: Int, number: Int, nCards: [Int]) -> Bool {
            var result = false
            
            if left > right { return false }
            
            let middle = (left + right) / 2
            if nCards[middle] > number {
                result = binarySearch(left: left, right: middle - 1, number: number, nCards: nCards)
            } else if nCards[middle] < number {
                result = binarySearch(left: middle + 1, right: right, number: number, nCards: nCards)
            } else {
                return true
            }

            return result
        }
    }
}
