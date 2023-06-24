//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/24.
//

import Foundation
class Main {
    enum Menu: Int {
        case americano = 4500
        case cafeLatte = 5000
        
        static func checkMenu(_ menu: String) -> Menu {
            if menu.contains("cafelatte") {
                return .cafeLatte
            }
            return .americano
        }
        
    }

    func solution(_ order:[String]) -> Int {
        var sum = 0
        
        for i in 0..<order.count {
            sum += Menu.checkMenu(order[i]).rawValue
        }
        return sum
    }
}
