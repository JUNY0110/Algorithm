//
//  17362.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon17362 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let num = Int(readLine()!)!
        var finger = num % 8
        if finger == 0 { print(2) }
        else {
            if finger == 7 { finger -= 4 }
            else if finger == 6 { finger -= 2 }
            print(finger)
        }
    }
    
    func solution2() {
        print([1,2,3,4,5,4,3,2][(Int(readLine()!)! - 1) % 8])
    }
}
