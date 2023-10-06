//
//  1271.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/05.
//

import Foundation


final class BaekJoon1244 {
    func run() {
        solution()
    }
    
    private func solution() {
        
        // MARK: - Enum
        
        enum Gender: Int {
            case male = 1
            case female = 2
        }
        
        // MARK: - Main
        
        let switchCount = Int(readLine()!)!-1
        var switchState = readLine()!.split(separator: " ").map { $0 == "1" ? true : false }
        let studentCount = Int(readLine()!)!

        for _ in 0..<studentCount {
            let info = readLine()!.split(separator: " ").compactMap { Int($0) }
            guard let gender = Gender(rawValue: info[0]) else { continue }
            let number = info[1]-1
            
            switch gender {
            case .male:
                toggleSwitchOfMale(from: number, to: switchCount)
            case .female:
                toggleSwitchOfFemale(with: number)
            }
        }
        let result = switchState.map{$0 == true ? "1" : "0"}
        
        for i in 0..<result.count {
            if i != 0 && i % 20 == 0 {
                print()
            }
            print(result[i], terminator: " ")
        }
        
        // MARK: - Methods
        
        func toggleSwitchOfMale(from number: Int, to switchCount: Int) {
            for num in number...switchCount where (num+1) % (number+1) == 0 {
                switchState[num].toggle()
            }
        }
        
        func toggleSwitchOfFemale(with number: Int) {
            var maxScope = min(switchCount - number, number)
            
            while maxScope > -1 {
                let standard = switchState[number-maxScope...number+maxScope]
                let comparison = ArraySlice(standard.reversed())

                if comparison == standard {
                    for num in number-maxScope...number+maxScope {
                        switchState[num].toggle()
                    }
                    break
                }
                maxScope -= 1
            }
        }
    }
}
