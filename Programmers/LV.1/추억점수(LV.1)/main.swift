//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/11.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let name = readLine()!.split(separator: " ").map { String($0) }
        let yearning = readLine()!.split(separator: " ").compactMap { Int($0) }
        let photo = readLine()!.split(separator: " ").map { $0.map { String($0) } }
        print(solution(name, yearning, photo))
    }
    
    func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
        var missed = missedPeopleAndPoints(name, yearning)
        var result = [Int]()
        
        for people in photo {
            result.append(sumOfYearningPoint(people, missed))
        }
        
        return result
    }
    
    func missedPeopleAndPoints(_ name:[String], _ yearning:[Int]) -> [String: Int] {
        var missed = [String: Int]()
        
        for (person, point) in zip(name, yearning) {
            missed[person] = point
        }
        return missed
    }
    
    
    func sumOfYearningPoint(_ people: [String], _ missed: [String: Int]) -> Int{
        var sum = 0
        
        for person in people {
            if let yearningPoint = missed[person] {
                sum += yearningPoint
            }
        }
        return sum
    }
    
    
    func solution2(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
        var missed = [String: Int]()
        
        for (person, point) in zip(name, yearning) {
            missed[person] = point
        }
        
        var result = [Int]()
        
        for people in photo {
            let sum = people
                .filter { missed.keys.contains($0) }
                .reduce(0) { $0 + missed[$1]! }
            
            result.append(sum)
        }
        
        return result
    }
}
