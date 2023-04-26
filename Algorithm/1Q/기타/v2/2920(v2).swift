//
//  2920.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/11.
//

import Foundation

class BaekJoon2920 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let musicNum = readLine()!.split(separator: " ").map { Int(String($0))! }

        if musicNum == musicNum.sorted(by: <) {
            print("ascending")
        } else if musicNum == musicNum.sorted(by: >) {
            print("descending")
        } else {
            print("mixed")
        }
    }
    
    func solution2() {
        let musicNum = readLine()!.split(separator: " ").map { Int(String($0))! }

        print(musicNum == musicNum.sorted(by: <) ? "ascending" :
                (musicNum == musicNum.sorted(by: >) ? "descending" : "mixed"))
    }
}
