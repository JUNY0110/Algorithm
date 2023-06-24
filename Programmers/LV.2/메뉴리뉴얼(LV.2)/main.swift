//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/23.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let orders = readLine()!.split(separator: " ").map { String($0) }
        let course = readLine()!.split(separator: " ").compactMap{Int($0)}
        
        print(solution(orders, course))
    }

    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        let orders = orders.map { String($0).map { String($0) }.sorted() }
        var combination = [[String]: Int]()

        // 고객별 주문 리스트 확인
        func dfs(_ start: Int, _ menus: [String], _ combi: [String], _ count: Int) {
            if count == menus.count {
                return
            }

            for i in start..<menus.count {
                combination[combi + [menus[i]], default: 0] += 1
                dfs(i+1, menus, combi + [menus[i]], count + 1)
            }
            return
        }

        // 고객별 주문 확인
        for i in 0..<orders.count {
            dfs(0, orders[i], [String](), 0)
        }

        var result = [String]()

        for c in course {
            let candidates = combination.filter{$0.key.count == c}

            if let max = candidates.values.max() {
                for (candidate, orderCnt) in candidates {
                    if max >= 2 && orderCnt == max {
                        result.append(candidate.joined())
                    }
                }
            }
        }
        return result.sorted()
    }
}
