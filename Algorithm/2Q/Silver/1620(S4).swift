//
//  1620.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/17.
//

import Foundation

class BaekJoon1620 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 포켓몬 도감 문제 맞추기
    /// - IMPORTANT: Dictionary 활용. Value만 알 때 어떻게 Key를 찾을 수 있을까!
    /// -- Value를 기준으로 정렬하여 Index를 이용해 Key를 찾아내는 방법
    
    func solution1() {
        let num = readLine()!.split(separator: " ").map { Int($0)! }
        var pokemons = [String: Int]()
        
        for n in 1...num[0] {
            pokemons[readLine()!] = n
        }
        
        let pokemonsArray = pokemons.sorted(by: {$0.value < $1.value})
        
        for _ in 0..<num[1] {
            guard let question = readLine() else { break }
            
            if pokemons.keys.contains(question) {
                print(pokemons[question, default: 0])
            } else {
                print(pokemonsArray[Int(question)! - 1].key)
            }
        }
    }
    
    // 단순히 Dictionary를 2개 생성하여, 키 밸류를 반전시킨 두 Dictionary 생성
    
    func solution2() {
        let num = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
        var pokemons1 = [String: Int]()
        var pokemons2 = [Int: String]()
        
        for index in 1...num[0] {
            guard let name = readLine() else { break }
            
            pokemons1[name] = index
            pokemons2[index] = name
        }
        
        for _ in 0..<num[1] {
            guard let question = readLine() else { break }
            
            if pokemons1.keys.contains(question) {
                print(pokemons1[question, default: 0])
            } else {
                print(pokemons2[Int(question)!, default: ""])
            }
        }
    }
}
