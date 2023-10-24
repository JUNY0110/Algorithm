//
//  4659.swift
//  Algorithm
//
//  Created by 지준용 on 10/24/23.
//

import Foundation


final class BaekJoon4659 {
    func run() {
        solution2()
    }
    
    private func solution() {
        let vowels = ["a", "e", "i", "o", "u"]
        let consonant = "bcdfghjklmnpqrstvwxyz".map { String($0) }
        
    outLoop: while let input = readLine(), input != "end" {
        let password = input.map { String($0) }
        
        for i in 1..<password.count {
            if i > 1
                && (vowels.contains(password[i])
                    && vowels.contains(password[i-1])
                    && vowels.contains(password[i-2])
                    || consonant.contains(password[i])
                    && consonant.contains(password[i-1])
                    && consonant.contains(password[i-2])) {
                print("<\(input)> is not acceptable.")
                continue outLoop
            }
            
            
            if (password[i] != "e" && password[i] != "o") && password[i] == password[i-1] {
                print("<\(input)> is not acceptable.")
                continue outLoop
            }
            
        }
        if !password.contains(where: {$0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u"}) {
            print("<\(input)> is not acceptable.")
            continue
        }
        print("<\(input)> is acceptable.")
    }
    }
    
    private func solution2() {
        while let password = readLine(), password != "end" {
            if checkPassword(password) {
                print("<\(password)> is acceptable.")
            } else {
                print("<\(password)> is not acceptable.")
            }
        }
        
        func isVowel(_ word: String) -> Bool {
            let vowels = ["a", "e", "i", "o", "u"]
            return vowels.contains(word)
        }
        
        func checkPassword(_ password: String) -> Bool {
            let password = password.map { String($0) }
            var isValid = false
            
            for i in 0..<password.count {
                if i > 1 {
                    let a = isVowel(password[i])
                    let b = isVowel(password[i-1])
                    let c = isVowel(password[i-2])
                    
                    if a == b && b == c { return false }
                }
                
                if i > 0 && password[i] != "e" && password[i] != "o" && password[i] == password[i-1] {
                    return false
                }
                
                if isVowel(password[i]) {
                    isValid = true
                }
            }
            
            return isValid
        }
    }
}
