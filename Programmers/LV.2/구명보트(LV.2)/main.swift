//
//  구명보트(LV.2).swift
//  Programmers
//
//  Created by 지준용 on 6/5/24.
//

import Foundation


let main = Main()
main.run()

class Main {
    func run() {
        let peopleArray = [
            [70, 50, 80, 50],
            [70, 80, 50]
        ]
        let limits = [100, 100]
        let expectedResults = [3, 3]
        
        for i in 0..<peopleArray.count {
            let people = peopleArray[i]
            let limit = limits[i]
            let expectedResult = expectedResults[i]
            
            let output = solution2(people, limit)
            
            print("예제 \(i+1)번")
            
            if expectedResult == output {
                print("정답입니다. 정답: \(expectedResult), 출력값: \(output)")
            } else {
                print("오답입니다.")
                print("정답: \(expectedResult), 출력값: \(output)")
            }
            print("====================")
            print()
            
        }
    }

    /*
        구명보트 최대 2인 탑승 가능
        limit = 구명보트 무게제한
        구명보트를 최대한 적게 사용해서 사람들을 구출하자.
     */
    
    // MARK: - 구명보트 LV.2. Swift는 억울해
    private func solution(_ people: [Int], _ limit: Int) -> Int {
        var boat = 0
        var people = people.sorted(by: >)
        var result = [Int]()
        
        while !people.isEmpty {
            let heavyWeight = people.removeFirst() // 현재 가장 무거운 사람
            boat += heavyWeight                    // 보트에 탑승

            if let lightWeight = people.last, lightWeight+boat <= limit { // 가장 가벼운 사람이 함께 탈 수 있다면
                boat += people.removeLast()  // 함께 보트에 탑승
            }
            
            result.append(boat) // 떠나보낸 보트
            boat = 0            // 사람들이 보트에서 내렸으므로 초기화
        }
        
        return result.count
    }
    
    // 투포인터 풀이
    private func solution2(_ people: [Int], _ limit: Int) -> Int {
        var with = 0 // 함께 탑승한 보트 갯수
        var people = people.sorted(by: >)
        var left = 0
        var right = people.endIndex-1
        
        while left < right {
            if people[left] + people[right] <= limit { // 무겁고, 가벼운 사람이 함께 타도 된다면
                with += 1   // 함께 탄 보트 갯수 카운트
                right -= 1  // 가벼운 사람 보트 동승
            }
            left += 1  // 무거운 사람은 항상 탑승
        }
        
        
        return people.count - with // 인당 1대의 보트를 탔다고 가정하고, 함께 탄 사람 수 빼기
    }
}
