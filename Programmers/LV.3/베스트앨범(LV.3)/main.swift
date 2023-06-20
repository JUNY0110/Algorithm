//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/20.
//

import Foundation


let main = Main()
main.run()

class Main {
    func run() {
        let genres = readLine()!.split(separator: " ").map { String($0) }
        let plays = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(genres, plays))
    }
    
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        var played = [String: Int]() // genre, play
        var music = [String: [(n: Int, play: Int)]]()
        
        for n in 0..<genres.count {
            let genre = genres[n]
            let play = plays[n]
            
            played[genre, default: 0] += play  // 장르별 노래 재생횟수의 합
            music[genre, default: []].append((n, play))  // 고유번호별 음악 장르와 재생횟수
        }

        var results = [Int]()
        
        // 조건1. 속한 노래가 많이 재생된 장르를 먼저 수록
        for (genre, _) in played.sorted(by: { $0.value > $1.value }) {
            let albums = music[genre]!.sorted{
                // 조건3. 재생횟수가 같으면 고유번호 오름차순
                if $0.play == $1.play {
                    return $0.n < $1.n
                }
                return $0.play > $1.play  // 조건2. 앨범 재생횟수별 내림차순 정렬
            }.prefix(2) // 조건0. 장르별 재생횟수가 많은 음악 순으로 2개까지.
            
            // 답: 음악 고유번호 저장
            for album in albums {
                results.append(album.n)
            }
        }
        
        return results
    }
}
