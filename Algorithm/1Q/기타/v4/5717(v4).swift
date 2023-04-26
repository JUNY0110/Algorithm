//
//  5554.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon5717 {
    func run() {
        solution()
    }
    
    func solution() {
        while
            let input = readLine()?.split(separator: " ").map ({ Int(String($0))! }),
                input != [0, 0] { print(input[0] + input[1]) }
    }
}
