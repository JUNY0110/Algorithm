//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/12.
//

import Foundation


let main = Main()
main.run()

/*
 최빈값은 주어진 값 중에서 가장 자주 나오는 값을 의미합니다. 정수 배열 array가 매개변수로 주어질 때, 최빈값을 return 하도록 solution 함수를 완성해보세요. 최빈값이 여러 개면 -1을 return 합니다.
 
array                  result
[1, 2, 3, 3, 3, 4]        3
[1, 1, 2, 2]             -1
[1]                       1
*/


/// - NOTE: 문제풀이. 최빈값 구하기

class Main {
    func run() {
        print(solution2(readLine()!.split(separator: " ").map { Int($0)!} ))
    }
    
    
    func solution1(_ array:[Int]) -> Int {
        let array = array.sorted()
        var count = 1
        var result = [Int]()
        
        // 조건1. 숫자가 1개라면, array 첫번째 값 반환
        if array.count == 1 {
            return array[0]
        }
        
        // 조건2. 숫자가 2개 이상일 때,
        // 정렬된 배열의 앞뒤 숫자가 같으면 count += 1, 그렇지 않으면 1로 복귀
        for i in 1..<array.count {
            if array[i] == array[i - 1] {
                count += 1
            } else {
                count = 1
            }
            // count를 배열에 삽입
            result.append(count)
        }
        
        // count가 가장 큰 값이 여러개이면 -1 반환
        if result.firstIndex(of: result.max()!) != result.lastIndex(of: result.max()!) {
            return -1
        }
        // count가 가장 큰 값이 하나라면 그 값을 반환
        return array[result.firstIndex(of: result.max()!)!]
    }

    
    func solution2(_ array:[Int]) -> Int {
        // array의 같은 값끼리 Value로 묶고 key로 입력, value 배열이 갖고있는 element가 많은 순으로 정렬
        let sorted = Dictionary(grouping: array) { $0 }.sorted {$0.value.count > $1.value.count}
        
        // 정렬된 Dictionary의 갯수가 2개 이상이고, 0번과 1번의 value의 element 수가 같으면 -1. 그렇지 않으면 0번 키값(갯수)을 호출
        return sorted.count > 1 && sorted[0].value.count == sorted[1].value.count ? -1 : sorted[0].key
    }
}
