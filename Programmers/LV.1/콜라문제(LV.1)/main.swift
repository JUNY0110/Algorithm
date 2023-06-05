//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/03.
//

import Foundation

let main = Main()

main.run()

class Main {
    func run() {
        guard let a = Int(readLine()!),
              let b = Int(readLine()!),
              let n = Int(readLine()!) else { return }
        print(solution(a, b, n))
    }
    
    // 2 1 20 -> 19
    // 3 1 20 -> 9
    
    // 현재 빈병의 갯수 = (n개를 a로 나눈 몫 * b) + 나머지의 합
    // 받을 콜라 갯수 += (빈병 / a) * b
    
    func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
        var (a, b, n) = (a, b, n)
        var bottle = 0
        var result = 0
        
        while true {
            if n < a { break }
            
            bottle += (n / a) * b + (n % a)
            result += n / a * b
            
            n = (n / a) * b + (n % a)
        }
        return result
    }
}
