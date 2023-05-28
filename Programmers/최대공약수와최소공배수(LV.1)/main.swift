//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/28.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        print(solution1(n, m))
    }
    
    func solution1(_ n:Int, _ m:Int) -> [Int] {
        var divisor = 2
        var gcd = 1
        var (n, m) = (n, m)

        // 최대공약수 = 나누어떨어지는 수의 곱
        // 최소공배수 = 최대공약수 * (최대공약수로 나눈 몫)
        while true {
            // 나눌 값이 두 수의 최솟값보다 크면 함수 종료
            if divisor > min(n, m) { break }
            
            // n, m 나눠 떨어지는 divisor 구하기
            if n % divisor == 0 && m % divisor == 0 {
                n /= divisor
                m /= divisor
                
                // 최대공약수 = 나누어 떨어지는 수의 곱
                gcd *= divisor
                continue
            }
                    
            divisor += 1
        }
        
        // 답: 최대공약수, 최소공배수
        return [gcd, gcd * (n * m)]
    }
    
    func solution2(_ n:Int, _ m:Int) -> [Int] {
        var gcd = 1
        
        for i in 1...min(n, m) {
            if n % i == 0 && m % i == 0 {
                gcd = i
            }
        }
        
        return [gcd, (n * m) / gcd]
    }
    
    func solution3(_ s:String) -> String {
        var index = 0
        var result = ""
        for char in s {
            if char != " " {
                if index == 0 {
                    result += String(char).uppercased()
                } else {
                    result += String(char).lowercased()
                }
                index += 1
            } else {
                index = 0
                result += " "
            }
        }
        return result
    }
    
    func solution(_ n:Int, _ m:Int) -> [Int] {
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            let mod = a % b
            return mod == 0 ? min(a, b) : gcd(b, mod)
        }
        
        return [gcd(n, m), (n * m) / gcd(n, m)]
    }
}
