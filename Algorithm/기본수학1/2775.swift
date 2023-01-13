//
//  2775.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/09.
//

import Foundation

class BaekJoon2775 {
    func run() {
        solution2()
    }
    
    
    // MARK: - 정답
    func solution1() {
        let input = Int(readLine()!)!
        
        for _ in 0..<input {
            let k = Int(readLine()!)!
            let n = Int(readLine()!)!
            var array = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
            
            for i in 0...k {
                for j in 0...n {
                    if i == 0 {
                        array[i][j] = j + 1
                    } else {
                        if j == 0 {
                            array[i][j] = 1
                        } else {
                            array[i][j] = array[i - 1][j] + array[i][j - 1]
                        }
                    }
                }
            }
            print(array[k][n-1])
        }
    }
    
    func solution2() {
        if let input = readLine(),
           let num = Int(input) {
            
            for _ in 0..<num {
                guard let inputK = readLine(),
                      let inputN = readLine(),
                      let k = Int(inputK),
                      let n = Int(inputN) else { break }
                var array = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
                
                for i in 0...k {
                    for j in 0...n {
                        if i == 0 {
                            array[i][j] = j + 1
                        } else {
                            if j == 0 {
                                array[i][j] = 1
                            } else {
                                array[i][j] = array[i - 1][j] + array[i][j - 1]
                            }
                        }
                    }
                }
                print(array[k][n-1])
            }
        }
    }
    
    // MARK: - 오답 ( 층과 호를 순서대로 입력해주지 않고 건너뛰게 되면 제대로 된 값이 나오지 않음. )
    func solution3() {
        let floors = Int(readLine()!)!
        var array1: [Int] = []
        var array2: [Int] = []

        for i in 1...14 {
            array1.append( i * (i + 1) / 2 )
        }

        for _ in 1...floors {
            let k = Int(readLine()!)!
            let n = Int(readLine()!)!
            var result = 0

            if k == 1 {
                print(array1[n-1])
            }
            if k != 1 {
                if k % 2 == 0 {
                    array1.forEach {
                        result += $0
                        array2.append(result)
                    }
                    print(array2[n-1])

                } else {
                    array1.removeAll()
                    result = 0

                    array2.forEach {
                        result += $0
                        array1.append(result)
                    }
                    print(array1[n-1])
                    array2.removeAll()
                }
            }
        }
    }
}

