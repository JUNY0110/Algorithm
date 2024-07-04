//
//  21610.swift
//  Algorithm
//
//  Created by 지준용 on 7/4/24.
//

import Foundation


final class BaekJoon21610 {
    func run() {
        solution()
    }
    
    enum Direction: Int {
        case left = 1
        case topLeft
        case top
        case topRight
        case right
        case bottomRight
        case bottom
        case bottomLeft
    }
    
    // MARK: - 마법사 상어와 비바라기(구현)
    private func solution() {
        let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nm[0]
        let m = nm[1]
        
        var baskets = Array(repeating: Array(repeating: 0, count: n), count: n)
        var clouds = [[n-2, 0], [n-1, 0], [n-2, 1], [n-1, 1]]
        
        for r  in 0..<n { // 최초의 바구니 상태
            baskets[r] = readLine()!.split(separator: " ").compactMap { Int($0) }
        }
        
        let dx = [-1, 1, -1, 1]
        let dy = [-1, -1, 1, 1]
        
        
        for _ in 0..<m { // 비바라기 & 물복사 버그
            let command = readLine()!.split(separator: " ").compactMap { Int($0) }
            guard let dir = Direction(rawValue: command[0]) else { continue }
            let move = command[1]
            
            for i in clouds.indices { // 구름 이동
                switch dir {
                case .left:
                    clouds[i][1] = moveToLeftOrTop(clouds[i][1], move)
                case .topLeft:
                    clouds[i][1] = moveToLeftOrTop(clouds[i][1], move)
                    clouds[i][0] = moveToLeftOrTop(clouds[i][0], move)
                case .top:
                    clouds[i][0] = moveToLeftOrTop(clouds[i][0], move)
                case .topRight:
                    clouds[i][1] = moveToRightOrBottom(clouds[i][1], move)
                    clouds[i][0] = moveToLeftOrTop(clouds[i][0], move)
                case .right:
                    clouds[i][1] = moveToRightOrBottom(clouds[i][1], move)
                case .bottomRight:
                    clouds[i][1] = moveToRightOrBottom(clouds[i][1], move)
                    clouds[i][0] = moveToRightOrBottom(clouds[i][0], move)
                case .bottom:
                    clouds[i][0] = moveToRightOrBottom(clouds[i][0], move)
                case .bottomLeft:
                    clouds[i][1] = moveToLeftOrTop(clouds[i][1], move)
                    clouds[i][0] = moveToRightOrBottom(clouds[i][0], move)
                }
                
                let row = clouds[i][0]
                let col = clouds[i][1]
                baskets[row][col] += 1 // 이동 종료 시 물 담기
            }
            
            for cloud in clouds {
                var copyMagic = 0 // 물복사 마법
                let row = cloud[0]
                let col = cloud[1]
                
                for i in 0..<4 { // 대각선 체크
                    let nx = col + dx[i]
                    let ny = row + dy[i]
                    
                    if isValidGround(ny, nx) {
                        if baskets[ny][nx] != 0 { // 물이 있는 바구니이면
                            copyMagic += 1        // 바구니 갯수만큼 물복사 +1
                        }
                    }
                }
                
                baskets[row][col] += copyMagic
            }
            
            var temp = [[Int]]() // 새롭게 비구름이 생길 위치 임시 저장.
            
            for row in baskets.indices {
                for col in baskets.indices where baskets[row][col] >= 2 && !clouds.contains([row, col]) {
                    temp.append([row, col])
                    baskets[row][col] -= 2
                }
            }
            
            clouds = temp
        }
        
        var sum = 0
        
        baskets.forEach {
            sum += $0.reduce(0, +)
        }
        print(sum)
        
        func isValidGround(_ row: Int, _ col: Int) -> Bool { // 격자 밖인지 확인하는 함수
            if row < 0 || col < 0 || row >= n || col >= n {
                return false
            }
            return true
        }
        
        func moveToLeftOrTop(_ current: Int, _ move: Int) -> Int {
            return (current-move < 0) ? (n - abs(current-move) % n) % n: current-move
        }
        
        func moveToRightOrBottom(_ current: Int, _ move: Int) -> Int {
            return (current+move) % n
        }
    }
    
    /*
        n*n격자에 비바라기 연습
        각 격자에는 바구니가 있고, 바구니가 저장 가능한 물의 양은 제한이 없다.
        격자는 순환 형태.
            1번 행 위에 N번 행이 있음.
        비바라기
            4칸 정사각형으로 비구름 생성
     
        m = 구름 이동 명령 횟수
        d = 방향
        s = 거리
        
        명령 순서
            (비바라기)
                구름 생성
                구름 이동
                구름 도착 지점의 바구니 물 양 1 증가
                구름 소멸
            (물복사 버그 마법) 
                구름 생성 시, 바구니의 대각선 1 거리의 {물이 있는 바구니 수}만큼 물양 증가
                    경계를 넘어가는 칸은 대각선 방향 거리로 계산하지 않는다.
                바구니에 저장된 물 양이 2 이상인 모든 칸에 구름이 생긴다.
                    구름 생성 시, 해당 칸의 물 양이 2씩 줄어든다.
                    단, 방금 구름이 사라진 곳에서는 생성되지 않는다.
     
        목표: 모든 명령이 종료된 후, 바구니에 들어있는 물의양의 합은?
     
     
        비바라기(4칸) -> 이동 -> 물복사 버그-> 이동 -> 비내리기 -> 이동 -> 물복사
     */
}
