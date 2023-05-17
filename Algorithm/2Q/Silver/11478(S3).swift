//
//  11478.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/17.
//

import Foundation

class BaekJoon11478 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 서로다른 부분 문자열의 갯수
    /// - IMPORTANT: Set이 Array와 비교해 훨씬 빠름.  index가 아닌 Hash를 이용해 값을 찾기 때문.
    /// reduce는 O(n), for문도 O(n)이기에 reduce를 활용하면 O(n^3)까지 가게 됨.
    /// Set만 사용하면 O(n^2)으로 해결할 수 있다.
    
    func solution1() {
        let s = readLine()!.map { String($0) }
        var result = Set<String>()
        
        for i in 0..<s.count {
            var str = ""
            
            for j in i..<s.count {
                str += s[j]
                result.insert(str)
            }
        }
        
        print(result)
    }
    
    // 아래는 오답 과정
    
    func solution2() {
        let s = readLine()!.map { String($0) }
        var result = [String]()
        
        for i in 0..<s.count {
            for j in 0..<s.count {
                result.append(s[i...j].reduce("", +))
            }
        }
        
        print(result)
    }
    
    func solution3() {
        let s = readLine()!.map { String($0) }
        
        var start = 0
        var end = s.endIndex-1
        
        var result = Set<String>()
        
        while start <= end {
            result.insert(s[start...end].reduce("", +))
            
            if start == end {
                end -= 1
                start = 0
            } else {
                start += 1
            }
        }
        print(result)
        print(result.count)
    }
}
