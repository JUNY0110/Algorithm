//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/29.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let a = readLine()!
        let b = readLine()!
        print(solution1(a, b))
    }

    func solution1(_ a:String, _ b:String) -> String {
        var long = "", short = ""
        
        // 문자열의 길이가 긴 값과 짧은 값 비교
        if a.count >= b.count {
            long = a
            short = b
        } else {
            long = b
            short = a
        }
        
        var sum = 0
        var ten = 0
        var result = ""
        
        for _ in 0..<long.count {
            if short != "" {
                // 길이가 짧은 문자열과 긴 문자열 합
                sum = Int(String(long.last!))! + Int(String(short.last!))! + ten
                short.removeLast() // 가장 마지막 문자 삭제
            } else {
                // 길이가 긴 문자열
                sum = Int(String(long.last!))! + ten
            }
            long.removeLast() // 가장 마지막 문자 삭제
            
            // 추가 10의자리 수 초기화
            ten = 0
            
            // 문자열의 합이 10이상일 때,
            // 다음 숫자(ten) + 1,
            // 1의 자리 수(sum % 10) 만들기
            if sum >= 10 {
                ten = sum / 10
                sum = sum % 10
            }
            // 현재 자릿수의 값 + 지금까지 계산한 값
            result = String(sum) + result
        }
        
        // 다음자릿수가 있으면 추가
        if ten != 0 {
            result = String(ten) + result
        }
        
        return result
    }
    
    func solution2(_ a:String, _ b:String) -> String {
        var a = a, b = b
        var temp = 0
        var result = ""
        
        while true {
            var sum = temp
            
            // a가 빈문자열이 아니면,
            // 마지막 숫자를 더하고,
            // 마지막 숫자 제거
            if a != "" {
                sum += Int(String(a.last!))!
                a.removeLast()
            }
            
            // a와 동일
            if b != "" {
                sum += Int(String(b.last!))!
                b.removeLast()
            }
            
            // 1의 자리의 합의 1의 자리(현재 자릿수) + 이전 계산값
            result = String(sum % 10) + result
            // 10의 자릿수(다음 자릿수 + 1)
            temp = sum / 10
            
            // 모든 문자열이 비워지면 종료
            if a == "" && b == "" {
                break
            }
        }
        
        // temp가 남아있으면 추가
        if temp != 0 {
            result = String(temp) + result
        }
        
        return result
    }
    
    func solution3(_ a:String, _ b:String) -> String {
        var a = a, b = b
        var temp = 0
        var result = ""
        
        while true {
            var sum = temp
            
            if a != "" {
                guard let aLast = a.last,
                      let intA = Int(String(aLast)) else { break }
                sum += intA
                a.removeLast()
            }
            
            if b != "" {
                guard let bLast = b.last,
                      let intB = Int(String(bLast)) else { break }
                sum += intB
                b.removeLast()
            }
            
            result = String(sum % 10) + result
            temp = sum / 10
            
            if a == "" && b == "" {
                break
            }
        }
        
        if temp != 0 {
            result = String(temp) + result
        }
        
        return result
    }
}
