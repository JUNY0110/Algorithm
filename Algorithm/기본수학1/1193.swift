//
//  1193.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/06.
//

import Foundation

class BaekJoon1193 {
    func run() {
        solution5()
    }
    
    func solution1() {
        var input = Int(readLine()!)!
        var cnt = 0
        var n = 0
        var k = 0
        
        for _ in 1...input {
            cnt += 1
            if input <= cnt * (cnt + 1) / 2 {
                break
            }
        }
        
        input = input - (cnt - 1) * cnt / 2
        
        if cnt % 2 == 0 {
            n = 1
            k = cnt

            for _ in 1..<input {
                n += 1
                k -= 1
            }
        }

        if cnt % 2 == 1 {
            n = cnt
            k = 1

            for _ in 1..<input {
                n -= 1
                k += 1
            }
        }
        print("\(n)/\(k)")
    }
    
    func solution2() {
        var input = Int(readLine()!)!
        var cnt = 0
        var n = 0
        var k = 0
        
        for _ in 1...input {
            cnt += 1
            if input <= cnt * (cnt + 1) / 2 {
                break
            }
        }
        
        input = input - (cnt - 1) * cnt / 2
        n = (cnt % 2 == 0) ? 1 : cnt
        k = (cnt % 2 == 0) ? cnt : 1
        
        while input - 1 > 0 {
            if cnt % 2 == 0 {
                n += 1
                k -= 1
            } else {
                n -= 1
                k += 1
            }
            input -= 1
        }
        
        print("\(n)/\(k)")
    }
    
    func solution3() {
        var input = Int(readLine()!)!
        var cnt = 0
        var n = 0
        var k = 0
        
        for _ in 1...input {
            cnt += 1
            if input <= cnt * (cnt + 1) / 2 {
                break
            }
        }
        
        input = input - (cnt - 1) * cnt / 2
        n = (cnt % 2 == 0) ? 1 : cnt
        k = (cnt % 2 == 0) ? cnt : 1
        
        for _ in 1..<input where cnt % 2 == 0 {
            n += 1
            k -= 1
        }

        for _ in 1..<input where cnt % 2 == 1 {
            n -= 1
            k += 1
        }
        
        print("\(n)/\(k)")
    }
    
    func solution4() {
        var input = Int(readLine()!)!
        var cnt = 0
        var n = 0
        var k = 0
        
        for _ in 1...input {
            cnt += 1
            
            if input <= cnt * (cnt + 1) / 2 {
                input = input - (cnt - 1) * cnt / 2
                n = (cnt % 2 == 0) ? 1 : cnt
                k = (cnt % 2 == 0) ? cnt : 1
                
                while input - 1 > 0 {
                    n += (cnt % 2 == 0) ? 1 : -1
                    k += (cnt % 2 == 0) ? -1 : 1
                    input -= 1
                }
                break
            }
        }
        
        print("\(n)/\(k)")
    }
    
    func solution5() {
        let input = Int(readLine()!)!

        var sum = 0
        var index = 0

        for i in 1...input where sum < input {
            index = i
            sum += i
        }

        let n = index - (sum - input)
        let k = 1 + (sum - input)

        print(index % 2 == 1 ? "\(k)/\(n)" : "\(n)/\(k)")
    }
}
