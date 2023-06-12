//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/12.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let data = readLine()!.split(separator: " ").compactMap { String($0).compactMap { Int(String($0)) } }
        let col = Int(readLine()!)!
        let row_begin = Int(readLine()!)!
        let row_end = Int(readLine()!)!
        print(solution1(data, col, row_begin, row_end))
    }
    
    func solution1(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
        // 기본키를 Key로 설정, 각 Tuple을 Value로 설정
        let copyData = makeCopyData(of: data)

        // 정렬기준 - col번째 열 기준으로 오름차순
        //        - 값이 같은 게 있으면 기본키(col[0]) 기준으로 내림차순
        let sortedTable = sortTuple(copyData, col)
        var result = 0

        // row_begin ~ row_end 범위 내의 인덱스만 Tuple 확인\
        // Tuple(배열) 내의 값 합산
        // 각각의 값을 XOR연산
        for row in 0..<sortedTable.count where row_begin...row_end ~= (row+1) {
            result ^= sortedTable[row].value.map{$0 % (row+1)}.reduce(0, +)
        }

        return result
    }

    func makeCopyData(of data: [[Int]]) -> [Int: [Int]] {
        var copyData = [Int: [Int]]()

        // 기본키를 Key로 설정, 각 Tuple을 Value로 설정
        for row in 0..<data.count {
            let defaultKey = data[row][0]
            copyData[defaultKey] = data[row]
        }
        return copyData
    }
    
    func sortTuple(_ data: [Int: [Int]], _ col: Int) -> [(key: Int, value: [Int])] {
        return data.sorted {
            if $0.value[col-1] == $1.value[col-1] {
                return $0.key > $1.key
            }
            return $0.value[col-1] < $1.value[col-1]
        }
    }

    //MAKR: - /////////////////////////////////////////////////////////////////////////////
    func solution2(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
        var copyData = [Int: [Int]]()

        // 기본키를 Key로 설정, 각 Tuple을 Value로 설정
        for row in 0..<data.count {
            let defaultKey = data[row][0]
            copyData[defaultKey] = data[row]
        }
        
        // 정렬기준 - col번째 열 기준으로 오름차순
        //        - 값이 같은 게 있으면 기본키(col[0]) 기준으로 내림차순
        let sortedTable = sortTable2(copyData, col)
        var result = 0
        
        // row_begin ~ row_end 범위 내의 인덱스만 Tuple 확인\
        // Tuple(배열) 내의 값 합산
        // 각각의 값을 XOR연산
        for row in stride(from: row_begin-1, through: row_end-1, by: 1) {
            let tuple = sortedTable[row].value
            result ^= tuple.map{$0 % (row+1)}.reduce(0, +)
        }

        return result
    }

    func sortTable2(_ data: [Int: [Int]], _ col: Int) -> [(key: Int, value: [Int])] {
        return data.sorted {
            if $0.value[col-1] == $1.value[col-1] {
                return $0.key > $1.key
            }
            return $0.value[col-1] < $1.value[col-1]
        }
    }
}
