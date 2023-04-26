//
//  27866.swift
//  Algorithm
//
//  Created by 지준용 on 2023/03/09.
//

import Foundation

class BaekJoon27866 {
    func run() {
        solution()
    }
    
    func solution() {
//        let str = readLine()!.map{"\($0)"}
//        let num = Int(readLine()!)! - 1
//        print(str[num])
//
//        print(readLine()!.map{"\($0)"}[Int(readLine()!)!-1])
        
        @Sendable func fetchUserID(from server: String) async -> Int {
            if server == "primary" {
                return 97
            }
            return 501
        }
        
        @Sendable func fetchUserName(from server: String) async -> String {
            let userID = await fetchUserID(from: server)
            if userID == 501 {
                return "John Appleseed"
            }
            return "Guest"
        }
        
        @Sendable func connectUser(to server: String) async {
            async let userID = fetchUserID(from: server)
            async let username = fetchUserName(from: server)
            let greeting = await "Hello \(username), userID \(userID)"
            print(greeting)
        }
        
        Task {
            await connectUser(to: "primary")
        }
    }
}
