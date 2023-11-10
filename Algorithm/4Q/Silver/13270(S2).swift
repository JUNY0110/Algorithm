//
//  13270.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon13270 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)! // n인분
        var maxArray = [1]
        var minArray = [1]
        
        for i in 2...n {
            if i % 2 == 0 {
                maxArray.append(i)
            }
            maxArray.append(i)
            minArray.append(contentsOf: [i, i])
        }
        print(minArray[n-2], maxArray[n-2])
    }
}

