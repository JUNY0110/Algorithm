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
}
