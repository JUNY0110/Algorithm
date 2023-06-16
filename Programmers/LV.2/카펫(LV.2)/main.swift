//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/16.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let brown = Int(readLine()!)!
        let yellow = Int(readLine()!)!
        print(solution1(brown, yellow))
        
    }

    func solution1(_ brown:Int, _ yellow:Int) -> [Int] {
        let gridCount = brown + yellow
        var result = [Int]()
        
        for n in 1...Int(sqrt(Double(gridCount))) {
            // 전체 카펫 격자수의 약수 찾기
            if gridCount % n == 0 {
                // 가로 격자수 >= 세로 격자수
                let width = gridCount/n
                let height = n
                
                // 테두리만 갈색이므로, 가로 끝 2칸, 세로 끝 2칸을 제외한 범위를 찾아야 함.
                if yellow == (width-2) * (height-2) {
                    result = [width, height]
                    break
                }
            }
        }

        return result
    }
    
    func solution2(_ brown:Int, _ yellow:Int) -> [Int] {
        let colorCount = brown + yellow
        var browns = [Int]()
        var yellows = [Int]()
        
        for n in 1...Int(sqrt(Double(colorCount))) {
            if colorCount % n == 0 {
                browns.append(colorCount/n)
                yellows.append(n)
            }
        }
        
        var result = [Int]()
        
        for (b, y) in zip(browns, yellows) {
            if yellow == (b-2) *  (y-2) {
                result = [b, y]
            }
        }

        return result
    }
}
