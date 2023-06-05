//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/05.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let id_list = readLine()!.split(separator: " ").map { String($0) }
        let report = readLine()!.split(separator: " ").map { String($0) }
        let k = Int(readLine()!)!
        print(solution2(id_list, report, k))
    }
    
    // usersReport = 신고자, 신고당한 사람
    // reportedIDList = 신고당한 명단별 횟수
    // reportedIDCnt = 신고당한 횟수
    // id_list순서로 신고당한 사람 명단을 갖고있는 만큼 메일이 가야함.
    // usersReport value에 reportedIDCnt의 key가 포함된 만큼 메일이 가야함.
    
    // MARK: 메모리 - 39.3mb, 시간 - 1230.1ms
    func solution1(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        var users = [String: Set<String>]()
        users = userReport(id_list, report)
        
        var reportedIDs = [String]()
        
        for id in users.values {
            reportedIDs += id
        }
        
        let reportedIDList = Dictionary(grouping: reportedIDs) { $0 }
        var reportedIDCnt = [String: Int]()

        for (key, values) in reportedIDList where values.count >= k {
            reportedIDCnt[key] = values.count
        }
        
        var result = Array(repeating: 0, count: id_list.count)
        
        for i in 0..<id_list.count {
            for name in reportedIDCnt.keys {
                if users[id_list[i]]!.contains(name) {
                    result[i] += 1
                }
            }
        }

        return result
    }

    func userReport(_ id_list: [String], _ report: [String]) -> [String: Set<String>] {
        var usersReport = [String: Set<String>]()
        
        for id in id_list {
            usersReport[id] = []
        }
        
        for i in 0..<report.count {
            let reportIDs = report[i].split(separator: " ").map { String($0) }
            let user = reportIDs[0]
            let reportedID = reportIDs[1]
            
            usersReport[user]!.insert(reportedID)
        }
        return usersReport
    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: 메모리 - 40.6mb, 시간 - 1121.99ms
    func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        var users = [String: Set<String>]() // 누가 누구를 신고했는지
        var reported = [String: Int]()      // 누가 얼마나 신고를 당했는지

        // 기본값 세팅
        for id in id_list {
            users[id] = []
            reported[id] = 0
        }

        // 누가 누구를 신고했고, 얼마나 신고당했는지
        for rpt in Set(report) {
            let reportIDs = rpt.split(separator: " ").map { String($0) }
            let user = reportIDs[0] // 신고한 사람(유저)
            let reportee = reportIDs[1] // 신고당한 사람

            users[user]!.insert(reportee)
            reported[reportee]! +=  1
        }

        let idCount = id_list.count
        var result = Array(repeating: 0, count: idCount)

        // 유저가 신고한 사람 중, k번 이상 신고당한 사람이 있으면 메일 회신(횟수 계산)
        // where조건이 아닌 if조건에서 k 조건을 넣어도 되지만, 코드 가독성을 위해 where절로 조건 사용.
        for i in 0..<idCount {
            for id in reported.keys where reported[id]! >= k {
                if (users[id_list[i]] ?? []).contains(id) {
                    result[i] += 1
                }
            }
        }

        return result
    }
}
