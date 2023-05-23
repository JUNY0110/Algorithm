//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/23.
//

import Foundation

let main = Main()
main.run()

/*

*/

class Main {
    func run() {
        print(solution2(readLine()!))
    }
    
    /// - NOTE: 문제풀이. 올바른 괄호
    /// - IMPORTANT: 괄호가 올바르게 열리고 닫히는지 확인.
    
    func solution1(_ s:String) -> Bool {
        var count = 0
        
        for c in s {
            if c == "(" {
                count += 1
            } else if c == ")" {
                count -= 1
                
                if count < 0 {
                    return false
                }
            }
        }
        return count == 0 ? true : false
    }
    
    func solution2(_ s:String) -> Bool {
        var count = 0
        
        for c in s {
            switch c {
            case "(": count += 1
            case ")": count -= 1
            default: break
            }
            if count < 0  {
                return false
            }
        }
        return count == 0 ? true : false
    }
    
    
    // 오답. 효율성 검사에서 걸림.
    
    func solution3(_ s:String) -> Bool {
        var result = ""
        
        for c in s {
            result += String(c)
            
            if result.suffix(2) == "()" {
                result.removeLast(2)
            }
        }
        return result.isEmpty ? true : false
    }
}
