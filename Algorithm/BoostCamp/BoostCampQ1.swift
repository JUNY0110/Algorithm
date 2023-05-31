//
//  BoostCampQ1.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/30.
//

import Foundation

class BoostCampQ1 {
    func run() {
        let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution2(arr))
    }
    // 1 2 3 3 3 3 4 4
    // 3 2 4 4 2 5 2 5 5
    // 3 5 7 9 1
    
    func solution1(_ arr: [Int]) -> [Int] {
        let arr = arr.sorted()
        var result = [Int]()
        var count = 1
        
        for i in 1..<arr.count {
            // 이전 배열과 같으면 count + 1
            if arr[i-1] == arr[i] {
                count += 1
            } else {
                // 이전 배열과 다르면 count 초기화
                count = 1
            }
            
            result.append(count)
        }
        
        // 중복횟수 외에는 1로 초기화
        for j in 1..<result.count {
            if result[j-1] < result[j] {
                result[j-1] = 1
            }
        }
        
        // 중복횟수로만 재배열
        result = result.filter { $0 != 1 }
        
        return result.count > 0 ? result : [-1]
    }
    
    
    // for문을 줄인 코드
    func solution2(_ arr: [Int]) -> [Int] {
        var result = [Int]()
        
        if arr.count > 1 {
            let arr = arr.sorted()
            var count = 1
            
            for i in 1..<arr.count {
                if arr[i-1] == arr[i] {
                    count += 1
                    
                    if i == (arr.index(before: arr.endIndex)) {
                        result.append(count)
                    }
                } else {
                    if count > 1 {
                        result.append(count)
                    }
                    
                    count = 1
                }
            }
            
            result = result.filter { $0 != 1 }
        }
        
        return result.count > 0 ? result : [-1]
    }

    func solution3(_ arr: [Int]) -> [Int] {
        var dict = [Int: Int]()
        
        for n in arr {
            if dict[n] != nil {
                dict[n]! += 1
            } else {
                dict[n] = 1
            }
        }

        return dict.values.filter{$0 != 1}
    }
}
