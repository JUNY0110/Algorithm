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
        print(solution2(record))
        
    }
    
    func solution1(_ record:[String]) -> [String] {
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
    
    
    func solution2(_ record:[String]) -> [String] {
        var chatRoom = [String: String]() // 채팅룸 유저아이디, 유저닉네임 기록
        var users = [(id: String, enter: Bool)]()    // 유저별 입장기록 저장
        
        // 유저 상태 저장
        for i in 0..<record.count {
            let r = record[i].split(separator: " ").map { String($0) }
            let status = r[0]
            let uid = r[1]
            
            switch action {
            case "Enter":            // 입장
                users.append((id: uid, enter: true))
                chatRoom[uid] = r[2] // 닉네임 저장
            case "Leave":            // 나감
                users.append((id: uid, enter: false))
            case "Change":
                chatRoom[uid] = r[2] // 닉네임 변경
            default: break
            }
        }
        
        var result = [String]()
        
        for user in users {
            if user.enter {
                result.append("\(chatRoom[user.id, default: "에디"])님이 들어왔습니다.")
                continue
            }
            result.append("\(chatRoom[user.id, default: "에디"])님이 나갔습니다.")
        }
        
        return result
    }
    
    enum Status: String {
        case enter = "enter"
        case leave = "leave"
        case change = "change"
    }
    
    struct User {
        var id: String
        var status: Status
    }
    
    func solution3(_ record:[String]) -> [String] {
        var chatRoom = [String: String]() // 채팅룸 유저아이디, 유저닉네임 기록
        var users = [User]()              // 유저별 입장기록 저장

        // 유저 상태 저장
        for i in 0..<record.count {
            let r = record[i].split(separator: " ").map { String($0) }
            
            if let status = Status(rawValue: r[0].lowercased()) { // 대소문자 오타 방지
                let uid = r[1]
                
                switch status {
                case .enter:             // 입장
                    users.append(User(id: uid, status: status))
                    chatRoom[uid] = r[2] // 닉네임 저장
                case .leave:             // 나감
                    users.append(User(id: uid, status: status))
                case .change:
                    chatRoom[uid] = r[2] // 닉네임 변경
                default: break
                }
            }
        }

        var result = [String]()

        for user in users {
            let userName = "\(chatRoom[user.id]!)님이"
            
            switch user.status {
            case .enter: result.append("\(userName) 들어왔습니다.")
            case .leave: result.append("\(userName) 나갔습니다.")
            default: break
            }
        }

        return result
    }

    
//    enum Action {
//        case enter, leave, change, unkown
//        static func fromString(_ command: String) -> Action {
//            switch command.lowercased() {
//            case "enter": return .enter
//            case "leave": return .leave
//            case "change": return .change
//            default: return .unkown
//            }
//        }
//    }
//
//    struct User {
//        var id = ""
//        var name = ""
//    }
//
//    struct Record {
//        var action: Action
//        var id = ""
//    }
//
//    func solution(_ record:[String]) -> [String] {
//        var users: [String: User] = [:]
//
//        func parseLine(_ line: String) -> (String, String, String?) {
//            let parsed = line.split(separator: " ")
//            let command = String(parsed[0])
//            let uid = String(parsed[1])
//            let name = parsed.count > 2 ? String(parsed[2]) : nil
//            return (command, uid, name)
//        }
//
//        func stringToRecord(_ parsed: (command: String, uid: String, name: String?)) -> Record {
//            return Record(action: Action.fromString(parsed.command), id: parsed.uid)
//        }
//
//        func registUser(_ parsed: (_: String, uid: String, name: String?)) {
//            guard let name = parsed.name else { return }
//            if var user = users[parsed.uid] {
//                user.name = name
//                users[parsed.uid] = user
//            } else {
//                users[parsed.uid] = User(id: parsed.uid, name: name)
//            }
//        }
//
//        func recordToString(_ r: Record) -> String? {
//            guard let user = users[r.id] else { return nil }
//            switch r.action {
//            case .enter: return "\(user.name)님이 들어왔습니다."
//            case .leave: return "\(user.name)님이 나갔습니다."
//            default: return nil
//            }
//        }
//
//        func doBeforeMap<A, B>(_ before: @escaping (A) -> Void, _ after: @escaping (A) -> B) -> (A) -> B {
//            return { a in
//                before(a)
//                return after(a)
//            }
//        }
//
//        return record.map(parseLine).map(doBeforeMap(registUser, stringToRecord))
//            .map(recordToString)
//            .filter({ $0 != nil })
//            .map({ $0! })
//    }
}
