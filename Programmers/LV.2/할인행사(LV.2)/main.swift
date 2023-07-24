//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/25.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let want = readLine()!.split(separator: " ").map { String($0) }
        let number = readLine()!.split(separator: " ").compactMap { Int($0) }
        let discount = readLine()!.split(separator: " ").map { String($0) }
        print(solution1(want, number, discount))
    }
    
    func solution1(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
        var result = 0
        
        for i in 0..<discount.count-9 {
            for j in 0..<want.count {
                if number[j] != discount[i..<i+10].filter({$0 == want[j]}).count {
                    break
                }
                if j == want.count-1 {
                    result += 1
                }
            }
        }
        return result
    }
    
    
    func solution2(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
        var dict = [String: Int]()
        var result = 0
        
        for i in 0..<want.count {
            dict[want[i]] = number[i]
        }

        for i in 0...(discount.count - 10) {
            var temp = [String: Int]()
            
            for j in i..<i+10 {
                temp[discount[j], default: 0] += 1
            }
            
            if dict == temp {
                result += 1
            }
        }
        return result
    }
}
