//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/02.
//

import Foundation

let main = Main()

main.run()

class Main {
    func run() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(numbers))
    }
    
    // 6 10 2 -> "6210"
    // 3 30 34 5 9 -> "9534330"
    
    func solution(_ numbers:[Int]) -> String {
        // 문자열 정렬
        // 두 수를 이어붙인 값이 큰 순서대로 정렬
        // 만약 모든 수가 0이라면 0 출력
        // 그렇지 않으면 수 출력
        var numbers = numbers.map { String($0) }
        
        numbers.sort(by: {
            return $0+$1 > $1+$0
        })
        
        return numbers[0] == "0" ? "0" : numbers.joined()
    }
}
