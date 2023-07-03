//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/03.
//

import Foundation
let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        print(solution2(n))
    }
    
    func solution(_ n:Int) -> Int {
        var nums = [0, 1]
        
        for i in 1..<n {
            nums.append((nums[i] + nums[i-1]) % 1234567)
        }
        
        return nums[n]
    }
}
