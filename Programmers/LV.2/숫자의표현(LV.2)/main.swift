//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 6/7/24.
//

import Foundation


let main = Main()
main.run()

class Main {
    func run() {
        let ns = [
            15
        ]
        let expectedResults = [4]
        
        for i in 0..<ns.count {
            let n = ns[i]
            let expectedResult = expectedResults[i]
            
            let output = solution2(n)
            
            print("예제 \(i+1)번")
            
            if expectedResult == output {
                print("정답입니다. 정답: \(expectedResult), 출력값: \(output)")
            } else {
                print("오답입니다.")
                print("정답: \(expectedResult), 출력값: \(output)")
            }
            print("====================")
            print()
            
        }
    }
    
    private func solution(_ n: Int) -> Int {
        var result = 0
        var numbers = Array(1...n)
        
        for i in 0..<n {
            var sum = 0
            
            for j in i...n where sum < n {
                sum += numbers[j]
            }
            
            if sum == n {
                result += 1
            }
        }
        
        
        return result
    }
    
    // 투포인터
    private func solution2(_ n: Int) -> Int {
        var result = 0
        let numbers = Array(1...n)
        var left = 0
        var right = 0
        var sum = 0
        
        func moveLeftIndex() {
            sum -= numbers[left]
            left += 1
        }
        
        func moveRightIndex() {
            sum += numbers[right]
            right += 1
        }
        
        while left < numbers.count {
            if sum == n {             // 합이 n과 같으면
                result += 1           // 방법 갯수 +1
                moveLeftIndex()       // 왼쪽 범위를 한 칸 오른쪽으로 이동
            }
            else if sum < n {
                moveRightIndex()
            }
            else if sum > n || right == n-1 {
                moveLeftIndex()
            }
        }
        
        return result
    }
}
