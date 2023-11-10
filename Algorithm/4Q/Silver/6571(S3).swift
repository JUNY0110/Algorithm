//
//  6571.swift
//  Algorithm
//
//  Created by 지준용 on 11/9/23.
//

import Foundation


final class BaekJoon1213 {
    func run() {
        solution()
    }
    
    private func solution() {
        let hansoo = readLine()!.map { String($0) }
        let hansooDict = Dictionary(grouping: hansoo, by: {$0})
        var checkCount = 0 // 홀수 갯수의 알파벳 갯수
        var result = ""
        var centerAlphabet = ""
        
        for (key, value) in hansooDict.sorted(by: {$0.key < $1.key}) {
            if value.count % 2 == 1 { // 홀수 갯수 알파벳 체크
                checkCount += 1
                
                if checkCount == 1 { // 홀수 갯수 알파벳이 등장하면 cneterAlphabet을 입력
                    centerAlphabet = key
                }
            }
            
            result += String(repeating: key, count: value.count / 2)
        }
        
        if checkCount > 1 {
            print("I'm Sorry Hansoo")
        } else {
            print(result + centerAlphabet + String(result.reversed()))
        }
    }
}
