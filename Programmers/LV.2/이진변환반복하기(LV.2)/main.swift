//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/29.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let s = readLine()!
        print(solution1(s))
    }
    
    func solution1(_ s:String) -> [Int] {
        var s = s
        var binaryCnt = 0 // 이진변환 횟수
        var zeroCnt = 0 // 지워진 0의 갯수
        
        while s != "1" {
            let xLength = s.filter{$0 != "0"}.count // 1의 갯수
            let zero = s.count - xLength // 0의 갯수

            s = String(xLength, radix: 2) // 이진변환
            
            binaryCnt += 1
            zeroCnt += zero
        }
        
        return [binaryCnt, zeroCnt]
    }
    
    func solution2(_ s:String) -> [Int] {
        var s = s
        var zeroCnt = 0
        var binaryCnt = 0
        
        while s != "1" {
            var c = s.filter{$0 != "0"}.count
            let zero = s.count - c
            var temp = "" // 반복마다 임시값 초기화
            
            // c가 0이 될 때까지 이진변환
            while c != 0 {
                temp = String(c % 2) + temp
                c /= 2
            }
            // 이진변환된 값을 s에 저장
            s = temp
            
            // 0의 갯수 합, 이진변환 횟수 +1
            zeroCnt += zero
            binaryCnt += 1
        }
        
        return [binaryCnt, zeroCnt]
    }
}
