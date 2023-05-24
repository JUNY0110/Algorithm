//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/24.
//

import Foundation
let main = Main()
main.run()

/*

*/

class Main {
    func run() {
        let count = Int(readLine()!)!
        var sizes = [[Int]]()
        
        for _ in 0..<count {
            let size = readLine()!.split(separator: " ").compactMap { Int($0) }
            sizes.append(size)
        }
        
        print(solution2(sizes))
    }
    
    /// - NOTE: 문제풀이.  최소직사각형
    /// - IMPORTANT: 최대 가로, 최대 세로 길이 구하기
    
    // 메모리: 19,610kb , 시간: 17.85ms
    func solution1(_ sizes:[[Int]]) -> Int {
        var copySizes = [[Int]]()
        
        // 전체 배열 카피 후, 내림차순 정렬
        sizes.forEach {
            copySizes.append($0.sorted(by: >))
        }
        
        var width = 0
        var height = 0
        
        // 가로, 세로 길이 비교 후 큰 값 반영
        for i in 0..<copySizes.count {
            if width < copySizes[i][0] {
                width = copySizes[i][0]
            }
            if height < copySizes[i][1] {
                height = copySizes[i][1]
            }
        }

        return width * height
    }

    // 메모리: 19,358kb , 시간: 9.80ms
    func solution2(_ sizes:[[Int]]) -> Int {
        var width = 0
        var height = 0
        
        // 배열마다 큰 값들 중, 가장 큰 값을 가로로
        // 배열마다 작은 값 중, 가장 큰 값을 세로로
        for size in sizes {
            width = max(width, size.max() ?? 0)
            height = max(height, size.min() ?? 0)
        }

        return width * height
    }
}

