//
//  2564.swift
//  Algorithm
//
//  Created by 지준용 on 11/14/23.
//

import Foundation


final class BaekJoon2564 {
    func run() {
        solution()
    }
    
    private func solution() {
        enum Direction: Int {
            case north = 1
            case south
            case west
            case east
        }
        
        let size = readLine()!.split(separator: " ").compactMap { Int($0) } // 블록 크기
        let width = size[0]
        let height = size[1]
        
        let storeCount = Int(readLine()!)! // 가게 갯수
        var stores = [(direction: Direction, distance: Int)]()
        
        for _ in 0..<storeCount {
            let condition = readLine()!.split(separator: " ").compactMap { Int($0) }
            guard let direction = Direction(rawValue: condition[0]) else { continue } // 방향: 북 = 1, 남 = 2, 서 = 3, 동 = 4
            let distance = condition[1] // 북,남에 위치하면 왼쪽으서 오른쪽으로, 동, 서에 위치하면 위에서 아래로. 거리 구하기.
            
            stores.append((direction, distance))
        }
        
        let myLocation = readLine()!.split(separator: " ").compactMap { Int($0) }
        if let myDirection = Direction(rawValue: myLocation[0]) {
            let myDistance = myLocation[1]
            var result = 0
            
            for i in 0..<storeCount {
                switch myDirection {
                case .north:
                    switch stores[i].direction {
                    case .north: result += abs(stores[i].distance - myDistance)
                    case .south: result += min(stores[i].distance + myDistance, (width - stores[i].distance) + (width - myDistance)) + height
                    case .west: result += stores[i].distance + myDistance
                    case .east: result += stores[i].distance + (width - myDistance)
                    }
                case .south:
                    switch stores[i].direction {
                    case .south: result += abs(stores[i].distance - myDistance)
                    case .north: result += min(stores[i].distance + myDistance, (width - stores[i].distance) + (width - myDistance)) + height
                    case .west: result += (height - stores[i].distance) + myDistance
                    case .east: result += (height - stores[i].distance) + (width - myDistance)
                    }
                case .west:
                    switch stores[i].direction {
                    case .west: result += abs(stores[i].distance - myDistance)
                    case .east: result += min(stores[i].distance + myDistance, (height - stores[i].distance) + (height - myDistance)) + width
                    case .north: result += stores[i].distance + myDistance
                    case .south: result += stores[i].distance + (height - myDistance)
                    }
                case .east:
                    switch stores[i].direction {
                    case .east: result += abs(stores[i].distance - myDistance)
                    case .west: result += min(stores[i].distance + myDistance, (height - stores[i].distance) + (height - myDistance)) + width
                    case .north: result += (width - stores[i].distance) + myDistance
                    case .south: result += (width - stores[i].distance) + (height - myDistance)
                    }
                }
            }
            print(result)
        }
    }
}
