//
//  1157.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/02.
//

import Foundation

class BaekJoon1157 {
    func run() {
        solution1()
    }
    
    // MARK: - Dictionary(해답)
    func solution1() {
        let input = readLine()!.uppercased()
        var inputDictionary: [String: Int] = [:]
        var result: [String] = []

        input.forEach {
            inputDictionary[String($0)] = (inputDictionary[String($0)] == nil ? 1 : inputDictionary[String($0)]! + 1)
        }

        for char in inputDictionary.keys where inputDictionary[char] == inputDictionary.values.max() {
            result.append(char)
        }

        print(result.count > 1 ? "?" : result[0])
    }
    
    // MARK: - 아래는 풀이했던 과정(해답 x)
    func solution2() {
        let input = readLine()!.uppercased()
        var inputArray = input.map { Int($0.asciiValue!) }
        var cntArray: [Int] = []
        var resultArray: [Int] = []
        var cnt = 0
        
        inputArray.sort()
        
        for i in 0..<inputArray.count {
            (i - 1 >= 0 && inputArray[i-1] == inputArray[i]) ? (cnt += 1) : (cnt = 0)
            cntArray.append(cnt)
        }

        for i in 0..<cntArray.count {
            if cntArray[i] == cntArray.max() {
                resultArray.append(i)
            }
        }

        cnt = resultArray[0]
        print(resultArray.count > 1 ? "?" : String(UnicodeScalar(inputArray[cnt])!))
    }
    
    func solution3() {
        let input = readLine()!.uppercased()
        let inputArray = input.map { $0 }
        var filterArray: [Int] = []
        var cnt = 0
        
        for index in inputArray.indices {
            filterArray.append(inputArray.filter{ $0 == inputArray[index] }.count)
        }
        
        filterArray.forEach {
            if $0 == filterArray.max()! {
                cnt += 1
            }
        }
        
        if filterArray.max()! == cnt {
            print(inputArray[filterArray.firstIndex(of: filterArray.max()!)!])
        } else {
            print("?")
        }
    }
    
    func solution4() {
        let inputArray = readLine()!.uppercased().map { String($0) }
        var filterArray: [Int] = []
        
        for index in inputArray.indices {
            filterArray.append(inputArray.filter{ $0 == inputArray[index] }.count)
        }
        
        let cnt = filterArray.filter { $0 == filterArray.max() }.count

        print(filterArray.max()! == cnt ? inputArray[filterArray.firstIndex(of: filterArray.max()!)!] : "?")
    }
    
    func solution5() {
        let input = readLine()!
        var inputArray: [Int] = []
        var cntArray: [Int] = []
        var resultArray: [Int] = []
        var cnt = 0
        
        input.forEach {
            let temp = Int(UnicodeScalar(String($0))!.value)
            inputArray.append(temp >= 97 ? temp - 32 : temp)
        }
        inputArray.sort()
        
        for i in 0..<inputArray.count {
            (i - 1 >= 0 && inputArray[i-1] == inputArray[i]) ? (cnt += 1) : (cnt = 0)
            cntArray.append(cnt)
        }
        
        for i in 0..<cntArray.count {
            if cntArray[i] == cntArray.max() {
                resultArray.append(i)
            }
        }
        cnt = resultArray[0]
        print(resultArray.count > 1 ? "?" : String(UnicodeScalar(inputArray[cnt])!))
    }
}
