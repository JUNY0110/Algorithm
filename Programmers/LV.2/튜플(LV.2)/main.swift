//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/17.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let tuple = readLine()!
        print(solution2(tuple))
        
    }
    
    func solution1(_ s:String) -> [Int] {
        // },를 기준으로 배열 구분
        var s = s.components(separatedBy: "},")
        var newS = [[String]]()
        
        // 이차원배열로 만들기 위해 newS 생성
        for i in 0..<s.count {
            newS.append([s[i]])
        }
        
        for j in 0..<newS.count {
            for k in 0..<newS[j].count {
                // {} 제거
                newS[j][k] = newS[j][k].replacingOccurrences(of: "}", with: "")
                newS[j][k] = newS[j][k].replacingOccurrences(of: "{", with: "")
            }
            // 내부 배열의 ,를 제거하여 문자열별 새롭게 배열 정의
            newS[j] = newS[j][0].split(separator: ",").map { String($0) }
        }
        
        // 내부 배열의 문자 갯수를 기준으로 정렬
        newS = newS.sorted {$0.count < $1.count}
        
        // 배열 내 값이 1개인 값은 저장
        var result = [Int(newS[0].joined())!]
        // 비교를 위한 aSet 정의
        var aSet = Set(newS[0])
        
        for i in 1..<newS.count {
            let bSet = Set(newS[i]) // 이전 배열과 비교를 위한 Set
            let temp = Array(bSet.subtracting(aSet))
            // 현재 배열에만 있는 값 저장
            result.append(Int(temp[0])!)
            aSet = bSet
        }
        
        return result
    }
    
    func solution2(_ s:String) -> [Int] {
        var s = s.map { String($0) }
        s = Array(s[1...s.endIndex-2]) // 가장 끝의 {}제거
        
        var stack = ""
        var newS = [[String]]()

        for i in 0..<s.count {
            switch s[i] {
            case "{": continue // 괄호가 열리면 넘기고
            case "}":          // 괄호가 닫히면 스택을 저장 및 초기화, 그리고 넘김
                newS.append(stack.split(separator: ",").map{String($0)})
                stack = ""
                continue
            case "," where s[i-1] == "}": continue // 괄호 다음의 ,일 때 넘김
            default: stack += s[i] // 괄호 안의 글자는 스택에 담기
            }
        }
        newS = newS.sorted{$0.count < $1.count}
        
        var result = [Int(newS[0][0])!]
        var aSet = Set(newS[0])
        
        for i in 1..<newS.count {
            let bSet = Set(newS[i])
            let temp = Array(bSet.subtracting(aSet))
            
            result.append(Int(temp[0])!)
            aSet = bSet
        }
        
        return result
    }
}
