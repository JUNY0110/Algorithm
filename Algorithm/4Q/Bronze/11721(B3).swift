//
//  11721.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/23.
//

import Foundation


class BaekJoon11721 {
    func run() {
        solution()
    }
    
    private func solution() {
        guard let stringInput = readLine() else { return }
        var result = ""

        for char in stringInput {
            result += String(char)
            
            if result.count == 10 {
                print(result)
                
                result = ""
            }
        }
        print(result)
    }
}
