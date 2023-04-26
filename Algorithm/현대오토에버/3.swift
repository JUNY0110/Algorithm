//
//  3.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/09.
//

import Foundation

class HyundaiAutoEver3 {
    func run() {
        solution1()
    }

    /*
        M = 연료탱크가 보관해야하는 최대 연료량
        출력값 = 가로, 세로, 높이
        최소 표면적으로 최대연료량을 보관하라!
        표면적 = 직육면제 6개의 면을 모두 합산한 값.

        임의의 값 3개를 곱해서 M보다 큰 값을 구해야 함.
        x, y, z

        1 < M < 100000
        1<= 가로, 세로, 높이 <= 50
     */
    /*
        입력예제1
        100

        출력예제1
        4 5 5

        가로, 세로, 높이가 각각4, 5, 5인 탱크의 용량은 4 x 5 x 5 = 100으로
        100의 연료를 모두 담을 수 있고, 이 때의 표면적은 130이 된다.

        입력예제2
        12345

        출력예제2
        21 21 28

        가로, 세로, 높이가 각각21, 21, 28인 탱크의 용량은 21 x 21 x 28= 12348으로 12345의 연료를 모두 담을 수 있고, 이 때의 표면적은 3234가 된다
     */
    
    // MARK: - 추측 1: 소인수분해 ( M보다 크거나 같은 값에 대한 )
    

    func solution1() {
        var M = Int(readLine()!)!
        var result = 0
        var volume = 0
        var surface = 125000
        var results = [0,0,0]
        
        while true {
            for x in 1...50 {
                for y in 1...50 {
                    for z in 1...50 {
                        volume = x * y * z
                        if M == volume && surface >= (x * y) + (y * z) + (x * z) {
                            result = volume
                                surface = (x * y) + (y * z) + (x * z)
                            results[0...2] = [x, y, z]
                        } 
                    }
                }
            }
            if M != result { M += 1 }
            else { break }
        }
        print(result)
        print(results.sorted(by: <).map{"\($0)"}.joined(separator: " "))
    }
}

