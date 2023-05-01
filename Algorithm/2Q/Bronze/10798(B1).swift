//
//  10798.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/01.
//

import Foundation

class BaekJoon10798 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 세로읽기
    /// - IMPORTANT: 입력 문자별 각 배열에 삽입하기, 문자 전체를 각 배열에 삽입하여 내부 배열에서 호출하기
    
    func solution1() {
        var results = [[String]]()

        for _ in 0..<5 {
            let str = readLine()!.map { String($0) }
            
            for j in 0..<str.count {
                if results.count < str.count {
                    results.append([])
                }
                results[j].append(str[j])
            }
        }
        
        results.forEach {
            print($0.map{String($0)}.joined(), terminator: "")
        }
    }
    
    func solution2() {
        var results = [[Character]]()
        
        for _ in 0..<5 {
            let str = Array(readLine()!)
            results.append(str)
        }
        
        for i in 0..<15 {
            for j in 0..<5 {
                if i < results[j].count {
                    print(results[j][i], terminator: "")
                }
            }
        }
    }
}
