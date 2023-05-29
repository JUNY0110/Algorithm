//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/29.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        print(solution1(n))
    }
    
    func solution1(_ n:Int) -> Int {
        let ternaryNum = String(n, radix: 3)
        
        return Int(String(ternaryNum.reversed()), radix: 3)!
    }

    func solution2(_ n:Int) -> Int {
        var n = n
        var ternaryNum = ""
        
        // 3진수 변환
        while n != 0 {
            ternaryNum = String(n % 3) + ternaryNum
            n /= 3
        }
        // 3진수 반전
        var reverseNum = Int(String(ternaryNum.reversed())) ?? 0
        
        var result = 0
        var count = 0
        
        // 3진수를 10진수로 변환
        while reverseNum != 0 {
            result += (reverseNum % 10) * Int(pow(Double(3), Double(count)))
            reverseNum /= 10
            count += 1
        }

        return result
    }
}
