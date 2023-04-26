//
//  2501.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/22.
//

import Foundation

class BaekJoon2501 {
    func run() { solution() }
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var arr = [Int]()
        
        for i in 1...nums[0] {
            if nums[0] % i == 0 {
                arr.append(i)
            }
        }
        
        print(nums[1]-1 >= arr.count ? 0 : arr[nums[1]-1])
    }
}
