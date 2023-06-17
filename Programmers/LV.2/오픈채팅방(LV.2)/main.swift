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
        let record = readLine()!.map { String($0) }
        print(solution(record))
        
    }

    func solution(_ record:[String]) -> [String] {
        var chatRoom = [String: String]() // 채팅룸 유저아이디, 유저닉네임 기록
        var usersID = [String]()          // 유저 아이디 저장
        var checkRecord = [Bool]()        // 들어온 기록, 나간 기록 저장
        
        // 유저 상태 저장
        for i in 0..<record.count {
            let r = record[i].split(separator: " ").map { String($0) }
            let condition = r[0]
            let uid = r[1]
            
            switch condition {
            case "Enter":            // 입장
                usersID.append(uid)
                checkRecord.append(true)
                chatRoom[uid] = r[2] // 닉네임 저장
            case "Leave":            // 나감
                usersID.append(uid)
                checkRecord.append(false)
            default: chatRoom[uid] = r[2] // 닉네임 변경
            }
        }
        
        var result = [String]()
        
        for i in 0..<checkRecord.count {
            let uid = usersID[i]
            
            // true이면 입장
            if checkRecord[i] {
                result.append("\(chatRoom[uid, default: "에디"])님이 들어왔습니다.")
                continue
            }
            
            // false이면 나감
            result.append("\(chatRoom[uid, default: "에디"])님이 나갔습니다.")
        }

        return result
    }

}
