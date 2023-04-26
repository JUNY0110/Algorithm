//
//  4999.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon4999 {
    func run() {
        solution()
    }
    
    func solution() {
        let justin = readLine()!
        let doctor = readLine()!
        
        if justin.last! == "h" && doctor.last! == "h" {
            if justin.count < doctor.count {
                print("no")
            } else {
                print("go")
            }
        }
    }
}
