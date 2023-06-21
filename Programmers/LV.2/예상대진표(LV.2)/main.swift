//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/21.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        print(solution2(n, a, b))
    }
    
    func solution1(_ n:Int, _ a:Int, _ b:Int) -> Int {
        var i = 1
        var (n, a, b) = (n, a, b)
        var answer = 0
        
        while a != b {
            let match = 2 * i
            
            // a가 속한 경기에서 이기면, 해당 경기의 앞 번호로 바뀜.
            if (match-1...match) ~= a {
                a = i
                answer += 1
            }
            
            // b가 속한 경기에서 이기면, 해당 경기의 앞 번호로 바뀜.
            if (match-1...match) ~= b {
                b = i
            }
            
            // 마지막 경기까지 진행 시, 다음 토너먼트 진행
            // 토너먼트 인원은 반으로 줄어듦
            if match == n {
                i = 1
                n /= 2
                continue
            }
            i += 1
        }
        return answer
    }
    
    func solution2(_ n:Int, _ a:Int, _ b:Int) -> Int {
        var a = a
        var b = b
        
        while a != b {
            a = (a+1)/2
            b = (b+1)/2
        }
        
        return 0
    }
}
