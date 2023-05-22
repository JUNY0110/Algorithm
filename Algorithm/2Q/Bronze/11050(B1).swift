//
//  11050.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/22.
//

import Foundation

class BaekJoon11050 {
    func run() {
        solution()
    }
    /// - NOTE: 문제풀이. 이항계수
    /// - IMPORTANT:이항계수에 대한 참고내용. https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=junhyuk7272&logNo=222053814549
    /// -- 조합(nCk)의 곱셈과 같다.
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        let n = nums[0], k = nums[1]
        
        print(factorial(n) / (factorial(k) * factorial(n - k)))
        
        func factorial(_ num: Int) -> Int {
            if num <= 1 {
                return 1
            }
            return num * factorial(num-1)
        }
    }
}
