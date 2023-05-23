//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/22.
//

import Foundation

let main = Main()
main.run()

/*
 progresses                  speeds                 return
 [93, 30, 55]                [1, 30, 5]             [2, 1]
 [95, 90, 99, 99, 80, 99]    [1, 1, 1, 1, 1, 1]    [1, 3, 2]

*/

class Main {
    func run() {
        let arr1 = readLine()!.split(separator: " ").map { Int($0)! }
        let arr2 = readLine()!.split(separator: " ").map { Int($0)! }
        print(solution2(arr1, arr2))
    }
    
    func solution1(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        // 앞 기능이 100%가 되지 못하면, 뒤 기능도 배포되지 못한다
        // 앞 기능이 100%가 되고 뒤 기능도 100%가 되면, 함께 배포가 가능하다
        var progresses = progresses
        let speeds = speeds
        var result = [Int]()
        var temp = 0
        
        while true {
            var count = 0
            
            for j in 0..<speeds.count {
                progresses[j] += speeds[j]
            }
            
            for _ in 0..<progresses.count {
                if progresses[count] < 100 {
                    break
                }
                count += 1
            }
            
            if temp != count {
                result.append(count-temp)
                temp = count
            }
            
            if result.reduce(0, +) == progresses.count {
                break
            }
        }

        return result
    }
    
    func solution2(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        var lastReleaseDate: Int = 0
        var numOfReleases: [Int] = []
        
        for i in 0..<progresses.count {
            let progress = Double(progresses[i])
            let speed = Double(speeds[i])
            let day = Int(ceil((100-progress) / speed))
            
            if day > lastReleaseDate {
                lastReleaseDate = day
                numOfReleases.append(1)
            } else {
                numOfReleases[numOfReleases.count - 1] += 1
            }
        }
        return numOfReleases
    }
}
