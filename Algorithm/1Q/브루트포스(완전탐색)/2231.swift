//
//  2231.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/10.
//

import Foundation

class BaekJoon2231 {
    func run() {
        solution3()
    }
    
    func solution1() {
        let n = Int(readLine()!)!
        var k = Int(floor(Double(n/2)))
        var m = ""
        
        while true {
            m = String(k)
            
            for i in m {
                k += Int(String(i))!
            }
            
            if k == n {
                print(m)
                break
            }
            
            k = Int(m)!
            k += 1
            
            if k > n {
                print(0)
                break
            }
        }
    }
    
    func solution2() {
        let n = Int(readLine()!)!
        let str = String(n)
        
        let tmp = Int(String(str.first!))! + 9 * (str.count - 1)
        var sum = 0
        
        for i in n-tmp ..< n {
            sum = i
            
            for j in String(i) {
                sum += Int(String(j))!
            }
            if sum == n {
                print(i)
                break
            }
        }
        if sum != n {
            print(0)
        }
    }
    
    func solution3() {
        func practice(n: Int) -> Int {
            let tmp = Int(String(String(n).first!))! + 9 * (String(n).count - 1)
            
            for i in n-tmp..<n {
                var sum = i
                
                for j in String(i) {
                    sum += Int(String(j))!
                }
                if sum == n {
                    return i
                }
            }
            return 0
        }
        print(practice(n: Int(readLine()!)!))
    }
}
