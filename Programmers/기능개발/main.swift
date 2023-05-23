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
 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.

 또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.

 먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.

 제한 사항
 작업의 개수(progresses, speeds배열의 길이)는 100개 이하입니다.
 작업 진도는 100 미만의 자연수입니다.
 작업 속도는 100 이하의 자연수입니다.
 배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다. 예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
 
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
