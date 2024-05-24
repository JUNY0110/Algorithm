//
//  2607.swift
//  Algorithm
//
//  Created by 지준용 on 5/24/24.
//

import Foundation


final class BaekJoon2607 {
    func run() {
        solution2()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let dict = Dictionary(uniqueKeysWithValues: zip(alphabet.map { String($0) }, Array(repeating: 0, count: alphabet.count)))
        var firstWord = dict
        var result = 0
        
    outLoop: for i in 0..<n {
        guard let word = readLine() else { continue }
        var nextWord = dict
        
        if i == 0 { // 첫번째 단어
            for char in word.map ({ String($0) }) {
                firstWord[char, default: 0] += 1
            }
            continue
        }
        
        for char in word.map ({ String($0) }) { // 다른 단어
            nextWord[char, default: 0] += 1
        }
        
        // MARK: 같은 구성을 가진 단어
        if firstWord == nextWord {
            result += 1
            continue
        }
        
        // MARK: 다른 구성을 가진 단어
        var count = 0
        
        for (key, value) in firstWord where value != nextWord[key] {
            if abs(nextWord[key]! - value) > 1 { // 한 글자가 2개 이상 차이나면 비슷한 단어가 아님.
                continue outLoop
            }
            
            if abs(nextWord[key]! - value) == 1 { // 1개 차이나는 글자만 카운팅
                count += 1
            }
        }
        
        if firstWord.values.reduce(0, +) == nextWord.values.reduce(0, +) { // 전체 글자 갯수가 같으면
            if count == 2 { // 한 글자 수정하면, count(2)를 좁힐 수 있음.
                result += 1
            }
        } else {            // 글자 갯수가 다르면
            if count == 1 { // 한 글자만 추가, 삭제하면 됨
                result += 1
            }
        }
    }
        print(result)
    }
    
    
    private func solution2() {
        let n = Int(readLine()!)!
        let firstWord = readLine()!.map { String($0) }.sorted()
        let length = firstWord.count
        var similar = 0
        
        for _ in 1..<n {
            var word = readLine()!.map { String($0) }.sorted()
            var count = 0
            
            for i in 0..<length {
                if let index = word.firstIndex(of: firstWord[i]) { // 단어에서 firstWord의 글자가 있으면
                    word.remove(at: index) // 소거하면서
                    count += 1             // 카운팅
                }
            }
            
            if count == length && word.count < 2 {
                // 단어 구성이 같을 때
                // word가 처음 입력한 단어가 가진 글자를 모두 가지고 있지만, word가 한 글자 더 길 때
                similar += 1
            }
            
            if count == length-1 && word.count < 2 {
                // word의 모든 글자를 가지지만 처음 입력한 단어가 한 글자 더 길 때 (word.count == 0, count == length -1)
                // 한 글자가 다를 때 (word.count == 1, count == length - 1)
                similar += 1
            }
        }
        print(similar)
    }
}
