//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/31.
//

import Foundation
let main = Main()

main.run()

class Main {
    func run() {
        let ingredient = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution2(ingredient))
    }
    
    // 2 1 1 2 3 1 2 3 1
    // 1 3 2 1 2 1 3 1 2
    // 0 1 2 3 1
    // 1 2 3 1
    // 1 3 2 3 3 1 2
    // 1 2 3 2 1 2 3
    // 2 1 2 3 1 2 3 1 1
    
    func solution1(_ ingredient:[Int]) -> Int {
        var ing = ingredient
        let recipe = [1, 2, 3, 1]
        var i = 3
        var result = 0

        while ing.count > 3 {
            // 인덱스 범위가 재료범위를 초과하면 종료
            if i > ing.count-1 {break}
            
            // 4개 배열 합이 레시피와 같으면,
            if i - 3 >= 0 && Array(ing[i-3...i]) == recipe {
                // 배열을 비우고,
                ing[i-3...i] = []
                // 인덱스 수정
                i -= 2
                result += 1
            } else {
                // 배열 합이 레시피와 다르면 인덱스 +1
                i += 1
            }
        }
        return result
    }
    
    func solution2(_ ingredient:[Int]) -> Int {
        var stack = [Int]()
        let recipe = [1, 2, 3, 1]
        var result = 0
        
        for i in ingredient {
            // 글자를 하나씩 삽입
            stack.append(i)
            // 뒤에서부터 4글자의 합이 햄버거 배열과 같으면
            // 배열 뒤에서 4개를 삭제
//            let stackSuffix = Array(stack.suffix(4)) -> Array로 감싸지 않으면 느려짐.
            if Array(stack.suffix(4)) == recipe {
                stack.removeLast(4)
                result += 1
            }
        }
        return result
        // 예상1
        // 단순히 suffix(4)를 하게되면, 서로 참조하고 있는 게 아닐까
        // Array로 감싸면 값 타입이 되는게 아닐까
    }
}
