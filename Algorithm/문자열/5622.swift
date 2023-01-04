//
//  5622.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/03.
//

import Foundation

class BaekJoon5622 {
    func run() {
        solution3()
    }
    
    func solution1() {
        let input = readLine()!.map{String($0)}
        let num = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
        var dic = [Int:[String]]()
        var gap = 0
        
        for i in num {
            if i == 7 || i == 9 {
                dic[i] = [alphabet[gap], alphabet[gap+1], alphabet[gap+2], alphabet[gap+3]]
                gap += 4
            } else if i == 8 {
                dic[i] = [alphabet[gap], alphabet[gap+1], alphabet[gap+2]]
                gap += 3
            } else if i > 1 {
                gap = i * 3 - 6
                dic[i] = [alphabet[gap], alphabet[gap+1], alphabet[gap+2]]
                gap += 3
            }
        }
        
        var result = 0
        
        input.forEach {
            for (key, value) in dic where value.contains($0) {
                result += key + 1
            }
        }
        print(result)
    }
    
    func solution2() {
        let input = readLine()!.map{String($0)}
        let dic: [Int:[String]] = [2:["A", "B", "C"], 3:["D", "E", "F"], 4:["G", "H", "I"],
                                   5:["J", "K", "L"], 6:["M", "N", "O"], 7:["P", "Q", "R", "S"],
                                   8:["T", "U", "V"], 9:["W", "X", "Y", "Z"]]
        var result = 0
        
        input.forEach {
            for (key, value) in dic where value.contains($0) {
                result += key + 1
            }
        }
        print(result)
    }
    
    func solution3() {
        let input = readLine()!.uppercased().map{String($0)}
        var time = 0
        
        input.forEach {
            switch $0 {
            case "A", "B", "C": time += 3
            case "D", "E", "F": time += 4
            case "G", "H", "I": time += 5
            case "J", "K", "L": time += 6
            case "M", "N", "O": time += 7
            case "P", "Q", "R", "S": time += 8
            case "T", "U", "V": time += 9
            case "W", "X", "Y", "Z": time += 10
            default: time = 0
            }
        }
        print(time)
    }
}

