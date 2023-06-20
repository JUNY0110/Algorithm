//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/20.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let clothes = readLine()!.split(separator: " ").map { String($0).map{String($0)} }
        print(solution(clothes))
    }
    
    func solution(_ clothes:[[String]]) -> Int {
        var myClothes = [String: [String]]()
        
        for i in 0..<clothes.count {
            let name = clothes[i][0]
            let type = clothes[i][1]
            // 기본값 "" : 해당 부위 의상을 입지 않았을 경우
            // 그 외: 해당 부위 의상을 입었을 경우
            myClothes[type, default: [""]].append(name)
        }
        
        var combination = 1
        // 부위별 의상을 입었을 때의 경우의 수
        for v in myClothes.values {
            combination *= v.count
        }
        
        // 아무 의상을 입지 않는 경우의 수 제거.
        return combination - 1
    }
}
