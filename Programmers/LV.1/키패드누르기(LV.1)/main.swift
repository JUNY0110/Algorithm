//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/27.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let hand = readLine()!
        print(solution(numbers, hand))
    }
    
    func solution(_ numbers:[Int], _ hand:String) -> String {
        var (l, r) = ([3,0], [3, 2]) // 왼손, 오른손의 최초 위치
        var keypad = [Int: [Int]]()
        var n = 1
        
        // 키패드별 위치 저장
        for i in 0..<3 {
            for j in 0..<3 {
                keypad[n, default: []] = [i, j]
                n += 1
            }
        }
        keypad[0] = [3, 1]
        
        var result = ""
        
        for num in numbers {
            if let pointer = keypad[num] {
                switch num {
                case 1, 4, 7: // 왼쪽 키패드는 왼손
                    l = pointer
                    result += "L"
                case 3, 6, 9: // 오른쪽 키패드는 오른손
                    r = pointer
                    result += "R"
                default:
                    let distanceL = abs(l[0] - pointer[0]) + abs(l[1] - pointer[1]) // 왼손과 번호의 거리
                    let distanceR = abs(r[0] - pointer[0]) + abs(r[1] - pointer[1]) // 오른손과 번호의 거리
                    
                    switch distanceL {
                    case ..<distanceR: // 왼손이 더 가까울 때
                        l = pointer
                        result += "L"
                    case (distanceR+1)... : // 오른손이 더 가까울 때
                        r = pointer
                        result += "R"
                    default: // 왼손, 오른손의 거리가 같으면 자주 사용하는 손
                        if let hand = hand.first {
                            hand == "l" ? (l = pointer) : (r = pointer)
                            result += hand.uppercased()
                        }
                    }
                }
            }
        }
        
        return result
    }
}
