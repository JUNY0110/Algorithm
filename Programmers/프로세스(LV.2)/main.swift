//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/24.
//

import Foundation
let main = Main()
main.run()

/*

*/

class Main {
    func run() {
        print(solution2(readLine()!.split(separator: " ").map { Int($0)! }, Int(readLine()!)! ))
    }
    
    /// - NOTE: 문제풀이. 올바른 괄호
    /// - IMPORTANT: 괄호가 올바르게 열리고 닫히는지 확인.
    
    func solution1(_ priorities:[Int], _ location:Int) -> Int {
        var p = priorities
        var l = location
        var result = 0
        // p를 하나씩 비우면서 체크
        // p가 최대값이 아니면 첫번째 배열을 제거하고 뒤에 추가
        // p가 최대값이면 첫번째배열을 제거하고 인덱스를 돌림
        // p가 빈 배열이 될 때까지 반복
        
        while p.count > 0 {
            let max = p.max() ?? 0
            let pZero = p[0]
            l -= 1
            
            if max != pZero {
                p.append(pZero)
                p.removeFirst()
                
                if l < 0 {
                    l = p.count - 1
                }
            } else {
                result += 1
                p.removeFirst()
                
                if l < 0 { break }
            }
        }
        return result
    }
    
    func solution2(_ priorities:[Int], _ location:Int) -> Int {
        var p = priorities
        var targetIdx = location
        
        while true {
            if p.contains(where: {$0 > p[0]}) {
                let first = p.removeFirst()
                p.append(first)
                
                targetIdx = (targetIdx - 1 < 0) ? (p.count - 1) : (targetIdx - 1)
            } else {
                if targetIdx == 0 {
                    return priorities.count - p.count + 1
                }
                
                p.removeFirst()
                targetIdx -= 1
            }
        }
    }
}
