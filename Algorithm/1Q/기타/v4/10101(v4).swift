//
//  10101.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon10101 {
    func run() {
        solution2()
    }
    
    func solution1() {
        var corners = [Int]()

        for _ in 0..<3 { corners.append(Int(readLine()!)!) }
        corners.sort()
        
        func triangle(_ corner1: Int, _ corner2: Int, _ corner3: Int) -> String {
            if corner1 == 60 && corner2 == 60 && corner3 == 60 { return "Equilateral" }

            if corners.reduce(0, +) == 180 {
                if corner1 == corner2 || corner2 == corner3 { return "Isosceles" }
                else { return "Scalene" }
            } else { return "Error" }
        }
        print(triangle(corners[0], corners[1], corners[2]))
    }
    
    func solution2() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        let c = Int(readLine()!)!
        
        print(a + b + c != 180 ? "Error" :
                a != b && a != c && b != c ? "Scalene" :
                a == b && a == c && b == c ? "Equilateral" : "Isosceles")
    }
    
    func solution3() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        let c = Int(readLine()!)!

        if a + b + c != 180 { print("Error") }
        else if a != b && a != c && b != c { print("Scalene") }
        else if a == b && a == c && b == c { print("Equilateral") }
        else { print("Isosceles") }
    }
}
