//
//  8911.swift
//  Algorithm
//
//  Created by 지준용 on 11/9/23.
//

import Foundation


final class BaekJoon8911 {
    func run() {
        solution2()
    }
    
    private func solution() {
        
        enum Command: String {
            case f
            case b
            case l
            case r
            
            func order(_ direction: Int) -> (direction: Int, move: Int) {
                switch self {
                case .f:
                    return (direction, 1)
                case .b:
                    return (direction, -1)
                case .l:
                    let temp = (direction == 3) ? 0 : direction + 1
                    return (temp, 0)
                case .r:
                    let temp = (direction == 0) ? 3 : direction - 1
                    return (temp, 0)
                }
            }
        }
        
        enum Direction: Int, CaseIterable {
            case n = 0
            case w = 1
            case s = 2
            case e = 3
        }
        
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let commands = readLine()!.map { String($0).lowercased() }
            var position = (x: 0, y: 0)
            var directions = (maxX: 0, minX: 0, maxY: 0, minY: 0)
            var currentDirection = 0
            
            for command in commands {
                guard let command = Command(rawValue: command) else { continue }
                let order = command.order(currentDirection)
                currentDirection = order.direction
                
                guard let direction = Direction(rawValue: currentDirection) else { continue }
                
                switch direction {
                case .n:
                    if command == .f || command == .b {
                        position.y += order.move
                    }
                case .s:
                    if command == .f || command == .b {
                        position.y -= order.move
                    }
                case .e:
                    if command == .f || command == .b {
                        position.x += order.move
                    }
                case .w:
                    if command == .f || command == .b {
                        position.x -= order.move
                    }
                }
                
                if directions.maxY > position.y {
                    directions.maxY = position.y
                    continue
                }
                if directions.minY < position.y {
                    directions.minY = position.y
                    continue
                }
                if directions.maxX > position.x {
                    directions.maxX = position.x
                    continue
                }
                if directions.minX < position.x {
                    directions.minX = position.x
                }
            }
            
            let area = (directions.maxX - directions.minX) * (directions.maxY - directions.minY)
            print(area)
        }
    }
    
    private func solution2() {
        let t = Int(readLine()!)!
        
        let dx = [-1, 0, 1, 0]
        let dy = [0, 1, 0, -1]
        
        enum Command: String {
            case f
            case b
            case l
            case r
        }
        
        for _ in 0..<t {
            let commands = readLine()!.map { String($0).lowercased() }
            var position = (x: 0, y: 0)
            var scale = (maxX: 0, minX: 0, maxY: 0, minY: 0)
            var currentDirection = 1
            
            for command in commands {
                guard let command = Command(rawValue: command) else { continue }
                
                switch command {
                case .f:
                    position.x = position.x + dx[currentDirection]
                    position.y = position.y + dy[currentDirection]
                case .b:
                    position.x = position.x - dx[currentDirection]
                    position.y = position.y - dy[currentDirection]
                case .l:
                    currentDirection = (currentDirection == 0) ? 3 : currentDirection - 1
                    continue
                case .r:
                    currentDirection = (currentDirection == 3) ? 0 : currentDirection + 1
                    continue
                }
                
                
                if scale.maxX < position.x {
                    scale.maxX = position.x
                    continue
                }
                
                if scale.minX > position.x {
                    scale.minX = position.x
                    continue
                }
                
                if scale.maxY < position.y {
                    scale.maxY = position.y
                    continue
                }
                
                if scale.minY > position.y {
                    scale.minY = position.y
                }
            }
            
            let area = (scale.maxX - scale.minX) * (scale.maxY - scale.minY)
            print(area)
        }
    }
}
