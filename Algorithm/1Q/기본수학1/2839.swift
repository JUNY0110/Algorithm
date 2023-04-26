//
//  2839.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/10.
//

import Foundation

class BaekJoon2839 {
    func run() {
        solution()
    }

    // 설탕을 최대한 적은 봉지에 담아 가져가기
    // 18kg = (5kg * 3) + (3kg * 1)
    // 무게가 3kg가 아니라면, 5kg봉투 먼저 계산 후, 3kg추가
    // 봉투무게의 합이 설탕무게와 최대한 같아야 함.
    // 큰봉투와 작은봉투 각각 무게의 합이 동일하다면, 큰봉투가 우선
    // 우선순위: 봉투무게합 > 봉투갯수

    func solution() {
        let sugarWeight = Int(readLine()!)!
        let smallBag = 3
        var smallBagAmount = 0
        
        while true {
            if (sugarWeight - (smallBag * smallBagAmount)).isMultiple(of: 5) {
                let bigBagAmount = (sugarWeight - (smallBag * smallBagAmount)) / 5
                print(bigBagAmount + smallBagAmount)
                break
            }
            if sugarWeight - (smallBag * smallBagAmount) < 0 {
                print(-1)
                break
            }
            smallBagAmount += 1
        }
    }
}
