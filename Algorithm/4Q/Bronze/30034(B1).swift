//
//  30034.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/04.
//

import Foundation


final class BaekJoon30034 {
    func run() {
        solution()
    }
    
    private func solution() {
        let _ = Int(readLine()!)!
        let stringSeparator = readLine()!.split(separator: " ").map { String($0) }
        let _ = Int(readLine()!)!
        let numberSeparator = readLine()!.split(separator: " ").map { String($0) }
        let _ = Int(readLine()!)!
        let mergeSeparator = readLine()!.split(separator: " ").map { String($0) }
        let _ = Int(readLine()!)!
        let sentence = readLine()!
        
        var separator = stringSeparator + numberSeparator
        
        separator = separator.filter{ !mergeSeparator.contains($0) }
        
        var result = ""
        
        for word in sentence {
            if separator.contains(String(word)) {
                result += " "
                continue
            }
            result += String(word)
        }
        
        result.split(separator: " ").forEach {
            print($0)
        }
    }
}
