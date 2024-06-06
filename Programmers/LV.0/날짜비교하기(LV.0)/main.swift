//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 6/6/24.
//

import Foundation


let main = Main()
main.run()

class Main {
    func run() {
        
        let date1s = [
            [2021, 12, 28],
            [1024, 10, 24]
        ]
        let date2s = [
            [2021, 12, 29],
            [1024, 10, 24]
        ]
        let expectedResults = [1, 0]
        
        for i in 0..<date1s.count {
            
            let date1 = date1s[i]
            let date2 = date2s[i]
            let expectedResult = expectedResults[i]
            
            let output = solution(date1, date2)
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
    
    private enum CompareDate: Int {
        case past = -1   // 비교군보다 앞서는 날
        case same = 0    // 비교군과 같은 날
        case future = 1  // 비교군보다 늦은 날.
    }
    
    private protocol CompareDateProtocol {  // 재사용성을 위한 프로토콜 사용
        func compareDate(_ time: Time) -> CompareDate
        func compareYear(_ time: Time) -> CompareDate
        func compareMonth(_ time: Time) -> CompareDate
        func compareDay(_ time: Time) -> CompareDate
    }
    
    private struct Time: CompareDateProtocol {
        private let year: Int  // 프로퍼티에 직접 접근하지 못하도록 은닉화
        private let month: Int
        private let day: Int
        
        init(date: [Int]) {    // date는 항상 3개의 element를 가지므로 별도 조건 추가 없음.
            self.year = date[0]
            self.month = date[1]
            self.day = date[2]
        }
        
        func compareDate(_ time: Time) -> CompareDate {
            let compareYear = self.compareYear(time)
            let compareMonth = self.compareMonth(time)
            let compareDay = self.compareDay(time)
            
            if compareYear == .same {
                if compareMonth == .same {
                    if compareDay == .same {
                        return compareDay
                    }
                    return compareDay
                }
                return compareMonth
            }
            return compareYear
        }
        
        func compareYear(_ time: Time) -> CompareDate {
            if self.year < time.year { return .past }   // 현재 연도가 비교군의 연도보다 빠르면, (과거)
            if self.year > time.year { return .future } // 현재 연도가 비교군의 연도와 같거나 늦으면, (미래)
            return .same                                // 현재 연도가 비교군의 연도와 같으면, (동년)
        }
        
        func compareMonth(_ time: Time) -> CompareDate {
            if self.month < time.month { return .past }   // 현재 월이 비교군의 월보다 빠르면, (과거)
            if self.month > time.month { return .future } // 현재 월이 비교군의 월과 같거나 늦으면, (미래)
            return .same                                  // 현재 월이 비교군의 월과 같으면, (동월)
        }
        
        func compareDay(_ time: Time) -> CompareDate {
            if self.day < time.day { return .past }   // 현재 일자가 비교군의 일자보다 빠르면, (과거)
            if self.day > time.day { return .future } // 현재 일자가 비교군의 일자와 같거나 늦으면, (미래)
            return .same                              // 현재 일자가 비교군의 일자와 같으면, (동일)
        }
    }
    
    private func solution(_ date1:[Int], _ date2:[Int]) -> Int {
        let findingDay = Time(date: date1) // date1 = 찾는 날짜
        let today = Time(date: date2)      // date2 = 오늘이라고 가정.
        
        return findingDay.compareDate(today) == .past ? 1 : 0 // 앞서는 날이 아니면 나중 날짜
    }
}
