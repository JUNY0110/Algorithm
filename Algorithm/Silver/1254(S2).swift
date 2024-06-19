//
//  1254.swift
//  Algorithm
//
//  Created by 지준용 on 6/18/24.
//

import Foundation


final class BaekJoon1254 {
    func run() {
        solution()
    }
    
    // MARK: - 팰린드롬 만들기(문자열)
    private func solution() {
        // s 뒤에 문자열을 0개 이상 추가해서 s문자열 전체가 팰린드롬이 되어야 한다.
        // 이 때, 만들어질 수 있는 팰린드롬 중 가장 작은 팰린드롬의 길이를 출력해라.
        let s = readLine()!
        let str = s.map { String($0) }
        var result = s.count * 2 - 1
        
        if s == String(s.reversed()) {
            print(s.count)
        } else {
            for i in 0..<s.count {
                let range = findPalindrome(i, s) // s에서 찾는 가장 큰 팰린드롬.
                
                if (range.right == s.count - 1) { // 끝과 맞닿은 팰린드롬이라면
                    if str[range.left...range.right].joined() == s {
                        result = s.count
                        break
                    }
                    
                    let temp = str[..<range.left].reversed()
                    let palindrome = str + Array(temp)
                    
                    if palindrome.count < result {
                        result = palindrome.count
                    }
                }
            }
            print(result)
        }
        
    }


    
    func findPalindrome(_ i: Int, _ s: String) -> (left: Int, right: Int) {
        var left = i
        var right = i
        let s = s.map { String($0) }
        
        while left-1 >= 0 && s[left] == s[left-1] {
            left -= 1
        }
        
        while right+1 < s.count && s[right] == s[right+1] {
            right += 1
        }
        
        while (left-1 >= 0) && (right+1 < s.count) && s[left-1] == s[right+1] {
            left -= 1
            right += 1
        }
        
        return (left, right)
    }
    
    private func solution2() {
        let s = readLine()!.map { String($0) }
        
        for i in 0..<s.count {
            let str = s[i...].reduce("", +)
            
            if isPalindrome(str) {
                print(s.count + i)
                break
            }
        }
    }
    
    private func isPalindrome(_ s: String) -> Bool {
        return s == String(s.reversed())
        
    }
}
