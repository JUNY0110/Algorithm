//
//  10988.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/26.
//

import Foundation

class BaekJoon10988 {
    func run() {
        solution2()
    }
    
    /// - Note: 문제풀이, 펠린드룸 확인하기
    /// - Important: 앞 뒤 글자 배열이 같은지 확인하기.
    
    func solution1() {
        let input = readLine()!.map{"\($0)"}
        var front = "", back = ""
        
        for i in 0..<input.count / 2 {
            front += input[i]
            back += input.reversed()[i]
        }
        
        print(front == back ? 1 : 0)
    }
    
    func solution2() {
        let input = readLine()!
        
        print(String(input.reversed()) == input ? 1 : 0)
    }
}
