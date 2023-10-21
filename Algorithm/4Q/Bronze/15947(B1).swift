//
//  15947.swift
//  Algorithm
//
//  Created by 지준용 on 10/17/23.
//

import Foundation


final class BaekJoon15947 {
    func run() {
        solution4()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        var words = [String]()
        var index = 0
        
        while words.count < num {
            let ru = String(repeating: "ru", count: index)
            words += "baby sukhwan tururu\(ru) turu\(ru) very cute tururu\(ru) turu\(ru) in bed tururu\(ru) turu\(ru) baby sukhwan".split(separator: " ").map { String($0) }
            
            index += 1
        }
        
        var word = words[num-1]
        
        if String(word.suffix(10)) == "rururururu" {
            var ruCount = 0
            
            while String(word.suffix(2)) == "ru" {
                word.removeLast(2)
                ruCount += 1
            }
            print(word + "+ru*\(ruCount)")
        } else {
            print(word)
        }
    }
    
    private func solution2() {
        let num = Int(readLine()!)!-1
        var words = "baby sukhwan tururu turu very cute tururu turu in bed tururu turu baby sukhwan".split(separator: " ").map { String($0) }
        let wordsCount = words.count
        let index = num % wordsCount
        let cycle = num / wordsCount
        
        if String(words[index].suffix(2)) == "ru" {
            words[index] += String(repeating: "ru", count: cycle)
        }
        
        var count = 0
        
        if String(words[index].suffix(10)) == "rururururu" {
            
            while words[index].suffix(2) == "ru" {
                words[index].removeLast(2)
                count += 1
            }
            
            words[index] += "+ru*\(count)"
        }
        
        print(words[index])
    }
    
    private func solution3() {
        let num = Int(readLine()!)!-1
        var words = "baby sukhwan tururu turu very cute tururu turu in bed tururu turu baby sukhwan".split(separator: " ").map { String($0) }
        let wordsCount = words.count
        let index = num % wordsCount
        let cycle = num / wordsCount
        
        if [2, 6, 10].contains(index) { // tururu
            if cycle >= 3 {
                words[index] = "tu+ru*\(cycle+2)"
            } else {
                words[index] += String(repeating: "ru", count: cycle)
            }
        }
        
        if [3, 7, 11].contains(index) { // turu
            if cycle >= 4 {
                words[index] = "tu+ru*\(cycle+1)"
            } else {
                words[index] += String(repeating: "ru", count: cycle)
            }
        }
        print(words[index])
    }
    
    private func solution4() {
        let num = Int(readLine()!)!-1
        var words = "baby sukhwan tururu turu very cute tururu turu in bed tururu turu baby sukhwan".split(separator: " ").map { String($0) }
        let wordsCount = words.count
        let index = num % wordsCount
        let cycle = num / wordsCount
        
        switch cycle {
        case 3... where [2, 6, 10].contains(index): 
            words[index] = "tu+ru*\(cycle+2)"
        case 4... where [3, 7, 11].contains(index): 
            words[index] = "tu+ru*\(cycle+1)"
        case 0... where [2, 3, 6, 7, 10, 11].contains(index): 
            words[index] += String(repeating: "ru", count: cycle)
        default: break
        }
        
        print(words[index])
    }
}
