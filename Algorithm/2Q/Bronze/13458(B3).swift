//
//  13458.swift
//  Algorithm
//
//  Created by 지준용 on 2023/06/22.
//

import Foundation

class BaekJoon13458 {
    func run() {
        solution()
    }

    func solution() {
        let sites = Int(readLine()!)!
        let testerOfSite = readLine()!.split(separator: " ").compactMap { Int($0) }
        let monitorable = readLine()!.split(separator: " ").compactMap { Int($0) }
        let main = monitorable[0]
        let sub = monitorable[1]
        
        var answer = sites
        
        for i in 0..<sites {
            let mainChecker = (testerOfSite[i] - main) >= 0 ? (testerOfSite[i] - main) : 0
            
            if (mainChecker % sub) == 0 {
                answer += mainChecker / sub
            } else {
                answer += mainChecker / sub + 1
            }
        }
        
        print(answer)
    }
}
