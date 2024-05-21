//
//  2179.swift
//  Algorithm
//
//  Created by 지준용 on 5/21/24.
//

import Foundation


final class BaekJoon2179 {
    func run() {
        solution()
    }
    
    struct Word {
        let word: String
        var index: Int
    }
    
    private func solution() {
        let n = Int(readLine()!)! // 입력 단어 갯수
        let words = savedWords(n) // n개의 word와 index 저장
        var lengths = Array(repeating: 0, count: n+1) // 원래 단어들이 입력된 순으로, count값 저장하기 위한 배열
        
        let sortedWords = words.sorted(by: {$0.word < $1.word}) // 비슷한 단어끼리 모아보기 위해 오름차순 정렬
        var maxCount = 0
        
        for i in 0..<n-1 {
            // 앞단어와 뒷단어의 같은 접두사 확인
            let left = sortedWords[i].word.map { String($0) }
            let right = sortedWords[i+1].word.map { String($0) }
            let count = countPrefixString(leftString: left, rightString: right) // 비교 문자열 간 같은 접두어 길이 재기
            
            maxCount = max(maxCount, count) // 같은 접두어를 가진 문자열 중, 가장 긴 접두어 확인
            lengths[sortedWords[i].index] = max(lengths[sortedWords[i].index], count)    // 입력 순으로 정렬된 배열에 왼쪽 단어의 가장 긴 접두어 길이 반영
            lengths[sortedWords[i+1].index] = max(lengths[sortedWords[i+1].index], count)// 입력 순으로 정렬된 배열에 오른쪽 단어의 가장 긴 접두어 길이 반영
        }
        
        var result = [String]()
        var firstIndex = -1
        
        for i in 0..<n where lengths[i] == maxCount { // 가장 긴 공통 접두어를 가진 배열만 봤을 때,
            result.append(words[i].word)
            
            if firstIndex == -1 {                     // 첫번째로 가장 긴 length 단어라면
                print(words[i].word)                  // 출력해주고
                firstIndex = words[i].index           // 해당 단어 (S)의 위치(index)를 저장해준다.
            }
        }
        
        // 입력된 순의 단어 중, 앞의 단어와 가장 먼저 일치하는 단어를 출력하기
        for i in 0..<result.count where result[i] != words[firstIndex].word {           // S와 T는 다른 단어여야 한다.
            if result[i].prefix(maxCount) == words[firstIndex].word.prefix(maxCount) {  // 가장 먼저 입력한 T 문자열 찾기
                print(result[i])
                break
            }
        }
    }
    
    func savedWords(_ n: Int) -> [Word] {
        var words = [Word]()
        
        for i in 0..<n { // 단어를 입력한 순서대로 저장
            guard let word = readLine() else { continue }
            words.append(Word(word: word, index: i))
        }
        return words
    }
    
    func countPrefixString(leftString: [String], rightString: [String]) -> Int {
        var count = 0
        
        for j in 0..<leftString.count where rightString.count > j {
            if leftString[j] != rightString[j] { break }  // 앞 단어와 뒷 단어의 글자가 다르면 종료
            count += 1                        // 앞 단어와 뒷 단어의 글자가 같으면 count + 1
        }
        return count
    }
}


/*
 n = int(input())
 a = [input() for _ in range(n)]

 # 입력받은 문자들을 인덱스와 함께 사전순으로 정렬한다.
 b = sorted(list(enumerate(a)),key = lambda x: x[1])

 # check 함수는 글자 하나하나가 서로 같은지 탐색
 def check(a, b):
     cnt = 0
 
     for i in range(min(len(a), len(b))):
         if a[i] == b[i]: 
            cnt += 1
         else: 
            break
 
     return cnt

 # 최장 접두사를 가진 문자열 담아둘 리스트 생성
 length = [0] * (n+1)
 maxlength = 0

 for i in range(n-1):
     # 인접한 두개의 문자열을  check함수에 대입
     # tmp 값은 동일한 접두사의 길이
     tmp = check(b[i][1], b[i+1][1])
 
     # 최장 접두사 길이 갱신
     maxlength = max(maxlength, tmp)
     
     # b[i][0]은 문자가 입력된 순서, 즉 인덱스
     # length 에 입력된 순서에 자기 접두사 길이를 저장
     # max 함수로 이전 값하고 현재 값하고 비교하여 집어넣음
     length[b[i][0]] = max(length[b[i][0]], tmp)
     length[b[i+1][0]] = max(length[b[i+1][0]], tmp)
     # length = [4, 0, 0, 0, 0, 4, 0, 0, 0, 0]
     
 first = 0
 
 for i in range(n):
 
     # 입력된 순서대로 접두사의 길이 비교
     if first == 0:
 
         # 만약 현재 접두사의 길이가 최장접두사라면
         if length[i] == max(length):
 
             # 제일 먼저 입력된 문자 출력
             first = a[i]
             print(first)
             pre = a[i][:maxlength]
     else:
         # 다음으로 입력되었된 값들 중 최장 접두사 출력후 종료
         if length[i] == max(length) and a[i][:maxlength] == pre:
             print(a[i])
             break
 출처: https://lazypazy.tistory.com/26 [Redddy's Devlog:티스토리]
*/
