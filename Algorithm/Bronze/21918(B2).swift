//
//  21918.swift
//  Algorithm
//
//  Created by 지준용 on 6/6/24.
//

import Foundation


final class BaekJoon21918 {
    func run() {
        solution()
    }
    
    enum BulbStatus: Int { // 전구 상태
        case on = 1
        case off = 0
        
        var toggle: BulbStatus {
            switch self {
            case .on:
                return .off
            case .off:
                return .on
            }
        }
    }
    
    enum Control: Int {
        case singleChange = 1 // 뒤에 {i, x}가 주어짐. i번째 전구의 상태를 x로 변경
        case rangeToggle      // 뒤에 {l, r}이 주어짐. l부터 r까지 상태를 반대로 변경.(on -> off), (off -> on)
        case allOff           // 뒤에 {l, r}이 주어짐. 범위 내 모든 전구를 끈다
        case allOn            // 뒤에 {l, r}이 주어짐. 범위 내 모든 전구를 킨다.
    }
    
    private func solution() {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let m = input[1] // 명령어 갯수
        var bulbs = readLine()!.split(separator: " ").compactMap { BulbStatus(rawValue: Int($0)!) }
        
        for _ in 0..<m { // 명령어 하나씩 실행
            let command = readLine()!.split(separator: " ").compactMap { Int($0) }
            guard let control = Control(rawValue: command[0]) else { continue }
            let l = command[1]
            let r = command[2]
            
            switch control {
            case .singleChange:
                let i = command[1]-1
                let x: BulbStatus = command[2] == 1 ? .on : .off
                bulbs[i] = x
            case .rangeToggle:
                for j in l-1..<r {
                    bulbs[j] = bulbs[j].toggle
                }
            case .allOff:
                for j in l-1..<r {
                    bulbs[j] = .off
                }
                
            case .allOn:
                for j in l-1..<r {
                    bulbs[j] = .on
                }
            }
            
        }
        
        bulbs.map{$0 == .on ? 1 : 0}.forEach {
            print($0, terminator: " ")
        }
    }
}
