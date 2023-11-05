//
//  1524.swift
//  Algorithm
//
//  Created by 지준용 on 11/1/23.
//

import Foundation


final class BaekJoon1524 {
    func run() {
        solution()
    }
    
    private func solution() {
        // 전쟁 시 가장 약한 병사가 사망
        // 가장 약한 병사가 한 팀에 여러명이 있으면 그 중 한 명이 임의로 사망.
        // 가장 약한 병사가 양팀에 있으면, 세비의 병사만 사망
        
        
        let t = Int(readLine()!)! // 게임 횟수
        
        for _ in 0..<t {
            _ = readLine()!
            _ = readLine()!.split(separator: " ").compactMap { Int($0) }
            
            let sejoon = readLine()!.split(separator: " ").compactMap { Int($0) }.max()!
            let sebi = readLine()!.split(separator: " ").compactMap { Int($0) }.max()!
            
            if sejoon < sebi {
                print("B")
            } else {
                print("S")
            }
        }
    }
}
