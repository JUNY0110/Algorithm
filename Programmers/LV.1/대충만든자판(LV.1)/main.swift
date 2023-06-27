//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/26.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let keymap = readLine()!.split(separator: " ").map { String($0) }
        let targets = readLine()!.split(separator: " ").map { String($0) }
        print(solution1(keymap, targets))
    }
    
    func solution1(_ keymap:[String], _ targets:[String]) -> [Int] {
        // keymap 배열에서 target의 인덱스를 찾아,
        // 인덱스가 작은 것을 더하면 됨.
        
        var result = [Int]()
        
        for target in targets {
            var sum = 0
            
            for char in target {
                var indexArray = [Int]()
                
                for i in 0..<keymap.count {
                    let word = keymap[i].map { $0 }
                    
                    indexArray.append(word.firstIndex(of: char) ?? 403)
                }
                
                if let minIndex = indexArray.min() {
                    if minIndex == 403 {
                        sum = -1
                        break
                    }
                    sum += minIndex + 1
                }
            }
            result.append(sum)
        }
        
        return result
    }
}
