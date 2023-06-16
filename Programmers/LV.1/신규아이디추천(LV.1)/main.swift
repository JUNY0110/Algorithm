//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/16.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let new_id = readLine()!
        print(solution(new_id))
        
    }
    
    func solution(_ new_id:String) -> String {
        // 소문자로 변환
        var cid = new_id.lowercased()
        
        // 특수문자 제거
        cid = deleteSpecialLetter(of: cid)
        // 연속적인 점 합치기
        combineSuccesiveDot(of: &cid)
        
        // 처음과 끝의 마침표 제거
        var id = removedID(".", of: cid)
        
        // 아이디가 빈문자열이면 aaa입력
        checkEmptyString(of: &id)
        
        let idLength = id.count
        // 글자수 초과이면 글자수 줄이기
        decreaseID(&id, idLength, maxCount: 15)
        
        // 글자수 미만이면 글자수 늘리기
        increaseID(&id, idLength, minCount: 3)

        return id
    }

    func deleteSpecialLetter(of cid: String) -> String {
        var temp = ""

        for s in cid {
            // 특수문자 있으면 제거
            if s.isNumber || s.isLetter || s == "-" || s == "_" || s == "." {
                temp.append(String(s))
            }
        }
        return temp
    }

    func combineSuccesiveDot(of cid: inout String) {
        while cid.contains("..") {
            // 연속된 .(마침표) 제거
            cid = cid.replacingOccurrences(of: "..", with: ".")
        }
    }

    func checkEmptyString(of id: inout String) {
        if id.isEmpty { id = "aaa" }
    }

    func removedID(_ dot: Character, of id: String) -> String {
        var id = id
        
        while !id.isEmpty {
            guard let fid = id.first else { return "" }
            if fid == dot { id.removeFirst() }
            if fid != dot { break }
        }
         
        while !id.isEmpty {
            guard let lid = id.last else { return "" }
            if lid == dot { id.removeLast() }
            if lid != dot { break }
        }
        return id
    }

    func decreaseID(_ id: inout String, _ idLength: Int, maxCount: Int) {
        // 아이디가 너무 길면 15글자만 남김
        if idLength > maxCount {
            id = String(id.prefix(maxCount))
            // 남은 글자의 첫글자와 끝글자가 .이면 제거
            id = removedID(".", of: id)
        }
    }

    func increaseID(_ id: inout String, _ idLength: Int, minCount: Int) {
        // 아이디가 2글자 이하이면 마지막 글자를 추가.
        if idLength < minCount {
            id += String(repeating: id.last!, count: minCount-idLength)
        }
    }

}
