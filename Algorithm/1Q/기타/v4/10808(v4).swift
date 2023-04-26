//
//  10808.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon10808 {
    func run() {
        solution()
    }
    
    func solution() {
        let s = readLine()!
        let alphabet = ["a": 1,"b": 2,"c": 3,"d": 4,"e": 5,
                        "f": 6,"g": 7,"h": 8,"i": 9,"j": 10,
                        "k": 11,"l": 12,"m": 13,"n": 14,"o": 15,
                        "p": 16,"q": 17,"r": 18,"s": 19,"t": 20,
                        "u": 21,"v": 22,"w": 23,"x": 24,"y": 25,"z": 26]
        var results = Array(repeating: 0, count: 26)

        for (index, value) in alphabet {
            s.forEach {
                if String($0) == index { results[value-1] += 1 }
            }
        }
        print(results.map{"\($0)"}.joined(separator: " "))
    }
}
