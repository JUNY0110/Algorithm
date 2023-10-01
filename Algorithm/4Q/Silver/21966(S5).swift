//
//  21966.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon21966 {
    func run() {
        solution()
    }
    
    private func solution() {
        let length = Int(readLine()!)!
        let s = readLine()!.map { String($0) }
        
        if length <= 25 {
            print(s.joined())
        } else {
            if s[12..<length-12].contains(".") {
                print(s.prefix(9).joined() + "......" + s.suffix(10).joined())
            } else {
                print(s.prefix(11).joined() + "..." + s.suffix(11).joined())
            }
        }
        
    }
}
