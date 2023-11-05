//
//  15819.swift
//  Algorithm
//
//  Created by 지준용 on 11/2/23.
//

import Foundation


final class BaekJoon15819 {
    func run() {
        solution()
    }
    
    private func solution() {
        let ni = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = ni[0], i = ni[1] - 1
        
        var handles = Array(repeating: "", count: n)
        
        for j in 0..<n {
            let handle = readLine()!
            handles[j] = handle
        }
        
        handles.sort()
        print(handles[i])
    }
}
