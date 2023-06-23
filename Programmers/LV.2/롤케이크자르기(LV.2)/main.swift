//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/23.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let topping = readLine()!.split(separator: " ").compactMap{Int($0)}
        print(solution(topping))
    }
    
    func solution(_ topping:[Int]) -> Int {
        var ob = Set<Int>() // 형이 가진 롤케익의 가짓수
        var yb = Dictionary(grouping: topping, by: {$0}) // 동생이 가진 롤케익의 가짓수, 롤케익별 몇개를 가졌는지 확인
        var result = 0
        
        for i in 0..<topping.count {
            ob.insert(topping[i])
            yb[topping[i]]!.removeLast()
            
            // 동생이 롤케익 종류 중 하나를 다 형을 줬으면, 딕셔너리를 지움
            if yb[topping[i]] == [] {
                yb[topping[i]] = nil
            }
            
            if ob.count == yb.count {
                result += 1
            }
        }
        return result
    }
}
