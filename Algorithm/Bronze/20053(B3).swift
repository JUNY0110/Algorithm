//
//  20053.swift
//  Algorithm
//
//  Created by 지준용 on 6/6/24.
//

import Foundation
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 {
            now = read()
        } // 공백과 줄바꿈 무시
        
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

final class BaekJoon20053 {
    func run() {
        solution()
    }
    
    private func solution() {
        let fileIO = FileIO()
        let t = fileIO.readInt()
        
        for _ in 0..<t {
            let n = fileIO.readInt()
            var nums = Array(repeating: 0, count: n)
            
            for i in 0..<n {
                nums[i] = fileIO.readInt()
            }
            
            nums.sort()
            print(nums[0], nums.last!)
        }
    }
}
