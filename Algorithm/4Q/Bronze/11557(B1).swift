//
//  11557.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation

class BaekJoon11557 {
    func run() {
        solution()
    }
    
    private func solution() {
        if let input = readLine(),
           let yearsCount = Int(input) {
            
            
            for _ in 0..<yearsCount {
                guard let schoolInput = readLine(),
                      let schoolCount = Int(schoolInput) else { continue }
                var result = (name: "", alcoholConsumption: Int.min)
                
                for _ in 0..<schoolCount {
                    let school = readLine()!.split(separator: " ").map { String($0) }
                    let schoolName = school[0]
                    guard let alcoholConsumption = Int(school[1]) else { continue }
                    
                    if alcoholConsumption > result.alcoholConsumption {
                        result = (schoolName, alcoholConsumption)
                    }
                }
                print(result.name)
            }
        }
    }
}
