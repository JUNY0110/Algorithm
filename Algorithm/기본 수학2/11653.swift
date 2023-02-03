//
//  11653.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/02.
//

import Foundation

class BaekJoon11653 {
    func run() {
        solution3()
    }

    func solution1() {
        var num = Int(readLine()!)!
        
        if num > 1 {
            for i in 2..<num {
                while num % i == 0 {
                    num /= i
                    print(i)
                }
            }
        }
        
        if num != 1 {
            print(num)
        }
    }
    
    func solution2() {
        if let input = readLine(),
           var num = Int(input) {

            if num == 1 {
                print("")
            }

            while num != 1 {
                for i in 2...num {
                    if num % i == 0 {
                        num /= i
                        print(i)
                        break
                    }
                }
            }
        }
    }
    
    func solution3() {
        var num = Int(readLine()!)!
        var count = 2
        
        while num > 1 {
            guard count * count <= num else {
                print(num)
                break
            }
            
            if num % count == 0 {
                print(count)
                num /= count
            } else {
                count += 1
            }
        }
    }
}
