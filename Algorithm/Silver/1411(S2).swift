//
//  1411.swift
//  Algorithm
//
//  Created by 지준용 on 5/24/24.
//

import Foundation


final class BaekJoon1411 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var maps = [[Int]]() // 변환된 배열을 저장하기 위한 배열
        
        for _ in 0..<n {
            guard let word = readLine() else { continue }
            let chars = word.map { String($0) }
            var map = [Int]() // 변환된 값
            var dict = [String: Int]()
            
            for j in 0..<chars.count {
                let char = chars[j]
                
                if dict[char] == nil { // 처음 변환하는 글자는
                    dict[char] = j     // 사전에 등록
                }
                 
                map.append(dict[char]!)   // 사전에 등록된 값을 입력
            }
            
            maps.append(map)
        }
        
        var result = 0
        
        for i in 0..<maps.count-1 { // 일치하는 단어 찾기
            for j in (i+1)..<maps.count {
                if maps[i] == maps[j] {
                    result += 1
                }
            }
        }
        
        print(result)
    }
}
