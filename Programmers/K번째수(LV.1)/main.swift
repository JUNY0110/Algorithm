//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/02.
//

import Foundation
let main = Main()

main.run()

class Main {
    func run() {
        let array = readLine()!.split(separator: " ").compactMap { Int($0) }
        let commands = Array(repeating: readLine()!.split(separator: " ").compactMap { Int($0) }, count: 3)
        print(solution(array, commands))
    }
    // 1 5 2 6 3 7 4
    // 2 5 3 4 4 1 1 7 3
    // return 5 6 3
    
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        // commands - 1
        // 커맨드 배열을 돌려서 내부 배열을 이용한다
        // 기존 배열을 커맨드배열의 요구대로 사본을 만든다
        // 커맨드의 요구 배열만 정렬시킨다
        // 위의 과정을 반복한다.
        var result = [Int]()
        
        for i in 0..<commands.count {
            let command = commands[i]
            let copy = array[(command[0]-1)...(command[1]-1)].sorted()
            
            result.append(copy[command[2]-1])
        }
        
        return result
    }
}
