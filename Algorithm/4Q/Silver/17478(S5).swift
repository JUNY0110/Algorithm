//
//  17478.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/26.
//

import Foundation

class BaekJoon17478 {
    func run() {
        solution()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        let story = "어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다."
        print(story)
        
        func recursion(_ underline: String, _ count: Int) {
            print("\(underline)" + #""재귀함수가 뭔가요?""#)
            
            if count == number {
                print("\(underline)" + #""재귀함수는 자기 자신을 호출하는 함수라네""#)
                return print("\(underline)라고 답변하였지.")
            }
            
            let description = """
                              \(underline)"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.
                              \(underline)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.
                              \(underline)그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어."
                              """
            print(description)
            recursion(String(repeating: "____", count: count+1), count + 1)
            print("\(underline)라고 답변하였지.")
        }
        
        recursion(String(repeating: "____", count: 0), 0)
    }
}
