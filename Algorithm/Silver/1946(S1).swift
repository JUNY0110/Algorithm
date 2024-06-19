//
//  1946.swift
//  Algorithm
//
//  Created by 지준용 on 6/20/24.
//

import Foundation


final class BaekJoon1946 {
    func run() {
        solution()
    }
    
    final class FileIO {
        private var buffer:[UInt8]
        private var index: Int
        
        init(fileHandle: FileHandle = FileHandle.standardInput) {
            buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
            index = 0
        }
        
        @inline(__always) private func read() -> UInt8 {
            defer { index += 1 }
            
            return buffer.withUnsafeBufferPointer { $0[index] }
        }
        
        @inline(__always) func readInt() -> Int {
            var sum = 0
            var now = read()
            var isPositive = true
            
            while now == 10
                    || now == 32 { now = read() }
            if now == 45{ isPositive.toggle(); now = read() }
            while now >= 48, now <= 57 {
                sum = sum * 10 + Int(now-48)
                now = read()
            }
            
            return sum * (isPositive ? 1:-1)
        }
    }
    
    struct Score {
        let paper: Int
        let interview: Int
    }
    
    // MARK: - 신입사원(그리디). Swift 입출력속도가 까다로운 문제.
    private func solution() {
        let file = FileIO() // 테스트 케이스
        let t = file.readInt()
        
        for _ in 0..<t {
            let n = file.readInt() // 지원자 수
            
            var candidates = Array(repeating: Score(paper: 0, interview: 0), count: n)
            var count = 1 // 1등은 언제나 우수하니까, 기본값 1
            
            for i in 0..<n { // 각 지원자의 {서류심사 성적 및 면접 성적 순위}
                let scores = (file.readInt(), file.readInt())// 둘 다 다른 지원자보다 부족하면 탈락. 둘 중 하나라도 우수하면 합격.
                let paperScore = scores.0
                let interviewScore = scores.1
                
                candidates[i] = Score(paper: paperScore, interview: interviewScore)
            }
            
            candidates.sort(by: {$0.paper < $1.paper}) // 서류 성적이 높은 순(오름차순)
            var minInterviewScore = candidates[0].interview
            
            for i in 1..<n {
                if minInterviewScore > candidates[i].interview { // 서류 성적이 높은 사람보다 면접 성적이 높다면
                    count += 1
                    minInterviewScore = candidates[i].interview
                }
            }
            
            print(count)
        }
    }
}
