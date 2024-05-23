//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 5/23/24.
//

import Foundation

let main = Main()

main.run()

class Main {
    func run() {
        let prices = 
        [
            [4, 3, 2, 1],
            [1, 2, 3, 2, 3],
            [1, 2, 3, 2, 3, 1]
        ]
        
        let expectedResults =
        [
            [1, 1, 1, 0],
            [4, 3, 1, 1, 0],
            [5, 4, 1, 2, 1, 0]
        ]
        
        for i in 0..<prices.count {
            let output = solution3(prices[i])
            
            print("\(i+1)번 문제 풀이: ", terminator: "")
            if expectedResults[i] == output {
                print("정답입니다.")
            } else {
                print("오답입니다.")
            }
            print("예상 출력값: \(expectedResults[i])", "사용자 출력값: \(output)", separator: "\n")
            print("입력 값 \(prices[i])")
            
            print("====================")
            print()
        }
    }
    
    // prices 초단위 주식 가격이 담긴 배열
    // 가격이 떨어지지 않은 기간은 몇 초인가?
    
    // 시간복잡도를 고려하지 않은 풀이: O(n^2). 10^5 * 10^5 = 10^10 > 10^8 ( 시간 초과 )
    private func solution(_ prices: [Int]) -> [Int] {
        let length = prices.count // 주식가격 배열 길이
        var result = Array(repeating: 0, count: length)
        
        
        for i in 0..<length-1 {
            for j in i+1..<length {
                result[i] += 1
                
                if prices[i] > prices[j] { break }
            }
        }
        
        return result
    }
    
    
    
    struct Queue<T> {
        var queue = [T?]()
        var head = 0
        
        var isEmpty: Bool {
            return queue.isEmpty
        }
        
        var count: Int {
            return queue.count
        }
        
        mutating func enqueue(_ price: T) {
            queue.append(price)
        }
        
        mutating func dequeue() -> T? {
            guard head <= queue.count, let element = queue[head] else { return nil }
            queue[head] = nil
            head += 1
            
            return element
        }
        
        mutating func clear() {
            queue = []
        }
    }
    
    // MARK: - Queue를 활용한 풀이.
    private func solution2(_ prices: [Int]) -> [Int] {
        let length = prices.count // 주식가격 배열 길이
        var result = Array(repeating: 0, count: length)
        var queue = Queue<Int>()
        queue.queue = prices
        
        while queue.head < queue.count {
            let index = queue.head // 현재 주가의 index
            guard let currentPrice = queue.dequeue() else { continue } // 현재 주가
            var seconds = 0        // 현재 주가가 몇초 동안 가격이 떨어지지 않았는지 카운팅
            
            for i in (index+1)..<queue.count { // 현재 주가와 미래 주가 비교를 위한 루프
                guard let futurePrice = queue.queue[i] else { continue }
                seconds += 1
                
                if currentPrice > futurePrice { break } // 주가가 떨어진거면 종료
            }
            
            result[index] = seconds
        }
        
        return result
    }
    
    // MARK: Stack을 이용한 풀이
    private func solution3(_ prices: [Int]) -> [Int] {
        let length = prices.count // 주식가격 배열 길이
        var result = Array(repeating: 0, count: length)
        var stack = [Int]()
        
        for future in 0..<length {
            while let lastIndex = stack.last { // prices의 값과 stack에 담긴 index를 활용한 값을 비교한다.
                let pastPrice = prices[lastIndex]
                let futurePrice = prices[future]
                
                if pastPrice <= futurePrice { break }
                
                if pastPrice > futurePrice { // 주가가 떨어지는 시점에는
                    let past = stack.removeLast()
                    result[past] = future - past  // 미래 인덱스에서 현재 인덱스를 빼면 초 계산이 된다.
                }
            }
            
            stack.append(future)
        }
        
        // 위의 계산을 하게 되면, stack의 0번과 마지막 인덱스를 포함한 몇개의 값이 남는다.
        
        for index in stack {
            result[index] = length - index - 1 // (전체 스택의 길이(length)에서 (index+1)을 뺀다)
        }
        
        return result
    }
}
