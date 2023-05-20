//
//  5052.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/20.
//

import Foundation

class BaekJoon5052 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 전화번호 목록
    /// - IMPORTANT: 문자열 내부 숫자의 정렬은 문자열의 길이가 아닌 앞에서부터의 숫자 크기 비교로 이뤄진다.
    
    func solution1() {
        let t = Int(readLine()!)!
        
        // 테스트케이스 갯수
        for _ in 0..<t {
            let n = Int(readLine()!)!
            var numberDirectory = [String]()
            // 번호입력 갯수
            for _ in 0..<n {
                let number = readLine()!
                numberDirectory.append(number)
            }
            // 문자열 기준으로 번호 정렬
            numberDirectory.sort()
            
            print(checkNumber(at: numberDirectory) ? "YES" : "NO")
        }
        // 번호 이상여부 확인
        func checkNumber(at numberDirectory: [String]) -> Bool {
            for i in 0..<numberDirectory.count - 1 {
                if numberDirectory[i+1].hasPrefix(numberDirectory[i]) {
                    return false
                }
            }
            return true
        }
    }
}
