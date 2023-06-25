//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/25.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        let lost = readLine()!.split(separator: " ").compactMap { Int($0) }
        let reserve = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution1(n, lost, reserve))
    }
    
    func solution1(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        var result = n - lost.count
        var lostTemp = lost.sorted()
        var reserved = reserve.sorted()
        
        for i in 0..<lostTemp.count{
            if let idx = reserved.firstIndex(of: lostTemp[i]){
                lostTemp[i] = -1
                reserved.remove(at: idx)
                result += 1
            }
            
        }
        
        for i in 0..<reserved.count{
            if lostTemp.contains(reserved[i] - 1){
                let idx = lostTemp.firstIndex(of: reserved[i] - 1)
                lostTemp.remove(at: idx!)
                result += 1
                continue
            }
            if lostTemp.contains(reserved[i] + 1){
                let idx = lostTemp.firstIndex(of: reserved[i] + 1)
                lostTemp.remove(at: idx!)
                result += 1
            }
           
        }
        return result
    }
    
    func solution2(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        var students = Array(repeating: 1, count: n+2)
        students[0] = 0
        students[n+1] = 0
        
        // 여분이 있는 학생과 도난당한 학생
        for i in 1...n {
            if reserve.contains(i) {
                students[i] += 1
            }
            if lost.contains(i) {
                students[i] -= 1
            }
        }

        for i in 1...n where students[i] == 0 {
            if students[i-1] == 2 {
                students[i-1] = 1
                students[i] = 1
                continue
            }
            
            if students[i+1] == 2 {
                students[i+1] = 1
                students[i] = 1
            }
        }
        
        return students.filter{$0 != 0}.count
    }
}
