//
//  1063.swift
//  Algorithm
//
//  Created by 지준용 on 11/11/23.
//

import Foundation


final class BaekJoon1063 {
    func run() {
        solution2()
    }
    
    private func solution() {
        enum Direction: String {
            case r, l, b, t
            case rt, lt, rb, lb
            
            func move() -> (col: Int, row: Int) {
                switch self {
                case .r: (1,0)
                case .l: (-1, 0)
                case .b: (0, -1)
                case .t: (0, 1)
                case .rt: (1, 1)
                case .lt: (-1, 1)
                case .rb: (1, -1)
                case .lb: (-1, -1)
                }
            }
        }
        
        let conditions = readLine()!.split(separator: " ").map { String($0) }
        var king = conditions[0].map { String($0) }
        var stone = conditions[1].map { String($0) }
        guard let n = Int(conditions[2]) else { return }
        
        let col = Array("ABCDEFGH").map { String($0) }
        
        var copyKing = king
        var copyStone = stone
        
        for _ in 0..<n {
            let command = readLine()!.lowercased()
            guard let direction = Direction(rawValue: command) else { continue }
            guard let kingColIndex = col.firstIndex(of: king[0]) else { continue }
            guard let stoneColIndex = col.firstIndex(of: stone[0]) else { continue }
            
            copyKing = king
            copyStone = stone
            
            switch direction {
            case .r: 
                if !moveToRight(&copyKing, &copyStone, kingColIndex, stoneColIndex) { continue }
            case .l:
                if !moveToLeft(&copyKing, &copyStone, kingColIndex, stoneColIndex) { continue }
            case .b:
                if !moveToBotton(&copyKing, &copyStone) { continue }
            case .t:
                if !moveToTop(&copyKing, &copyStone) { continue }
            case .rt:
                if !moveToRightTop(&copyKing, &copyStone, kingColIndex, stoneColIndex) { continue }
            case .lt:
                if !moveToLeftTop(&copyKing, &copyStone, kingColIndex, stoneColIndex) { continue }
            case .rb:
                if !moveToRightBottom(&copyKing, &copyStone, kingColIndex, stoneColIndex) { continue }
            case .lb:
                if !moveToLeftBottom(&copyKing, &copyStone, kingColIndex, stoneColIndex) { continue }
            }
            king = copyKing
            stone = copyStone
        }
        print(king.joined())
        print(stone.joined())
        
        func moveToRight(_ king: inout [String], _ stone: inout [String], _ kingColIndex: Int, _ stoneColIndex: Int) -> Bool {
            if kingColIndex + 1 >= 8 { return false }
            
            if king[1] == stone[1] && (kingColIndex+1) == stoneColIndex {
                if stoneColIndex+1 >= 8 { return false }
                
                stone[0] = col[stoneColIndex+1]
            }
            king[0] = col[kingColIndex+1]
            
            return true
        }
        
        func moveToLeft(_ king: inout [String], _ stone: inout [String], _ kingColIndex: Int, _ stoneColIndex: Int) -> Bool {
            if kingColIndex - 1 < 0 { return false }
            
            if king[1] == stone[1] && (kingColIndex-1) == stoneColIndex {
                if stoneColIndex-1 < 0 { return false}
                
                stone[0] = col[stoneColIndex-1]
            }
            king[0] = col[kingColIndex-1]
            
            return true
        }
        
        func moveToBotton(_ king: inout [String], _ stone: inout [String]) -> Bool {
            guard let kingRow = Int(king[1]) else { return false }
            guard let stoneRow = Int(stone[1]) else { return false }
            
            if kingRow - 1 <= 0 { return false }
            
            if king[0] == stone[0] && (kingRow-1) == stoneRow {
                if stoneRow-1 <= 0 { return false }
                
                stone[1] = String(stoneRow-1)
            }
            king[1] = String(kingRow-1)

            return true
        }
        
        func moveToTop(_ king: inout [String], _ stone: inout [String]) -> Bool {
            guard let kingRow = Int(king[1]) else { return false }
            guard let stoneRow = Int(stone[1]) else { return false }
            
            if kingRow + 1 > 8 { return false }
            
            if king[0] == stone[0] && (kingRow + 1) == stoneRow {
                if stoneRow + 1 > 8 { return false }
                
                stone[1] = String(stoneRow + 1)
            }
            king[1] = String(kingRow + 1)
            
            return true
        }
        
        func moveToRightTop(_ king: inout [String], _ stone: inout [String], _ kingColIndex: Int, _ stoneColIndex: Int) -> Bool {
            guard let kingRow = Int(king[1]) else { return false }
            guard let stoneRow = Int(stone[1]) else { return false }
            if kingColIndex + 1 >= 8 { return false }
            if kingRow + 1 > 8 { return false }
            
            if (kingColIndex+1 == stoneColIndex) && (kingRow+1 == stoneRow) {
                if stoneRow+1 > 8 || stoneColIndex+1 >= 8 { return false }
                stone[0] = col[stoneColIndex+1]
                stone[1] = String(stoneRow+1)
            }
            king[0] = col[kingColIndex+1]
            king[1] = String(kingRow+1)
            
            return true
        }
        
        func moveToRightBottom(_ king: inout [String], _ stone: inout [String], _ kingColIndex: Int, _ stoneColIndex: Int) -> Bool {
            guard let kingRow = Int(king[1]) else { return false }
            guard let stoneRow = Int(stone[1]) else { return false }
            if kingColIndex + 1 >= 8 { return false }
            if kingRow - 1 <= 0 { return false }
            
            if (kingColIndex+1 == stoneColIndex) && (kingRow-1 == stoneRow) {
                if stoneRow-1 <= 0  || stoneColIndex+1 >= 8  { return false }
                stone[0] = col[stoneColIndex+1]
                stone[1] = String(stoneRow-1)
            }
            king[0] = col[kingColIndex+1]
            king[1] = String(kingRow-1)
            
            return true
        }
        
        func moveToLeftBottom(_ king: inout [String], _ stone: inout [String], _ kingColIndex: Int, _ stoneColIndex: Int) -> Bool {
            guard let kingRow = Int(king[1]) else { return false }
            guard let stoneRow = Int(stone[1]) else { return false }
            if kingColIndex - 1 < 0  { return false }
            if kingRow - 1 <= 0 { return false }
            
            if (kingColIndex-1 == stoneColIndex) && (kingRow-1 == stoneRow) {
                if stoneRow-1 <= 0  || stoneColIndex-1 < 0   { return false }
                stone[0] = col[stoneColIndex-1]
                stone[1] = String(stoneRow-1)
            }
            king[0] = col[kingColIndex-1]
            king[1] = String(kingRow-1)
            
            return true
        }
        
        func moveToLeftTop(_ king: inout [String], _ stone: inout [String], _ kingColIndex: Int, _ stoneColIndex: Int) -> Bool {
            guard let kingRow = Int(king[1]) else { return false }
            guard let stoneRow = Int(stone[1]) else { return false }
            if kingColIndex - 1 < 0  { return false }
            if kingRow + 1 > 8 { return false }
            
            if (kingColIndex-1 == stoneColIndex) && (kingRow+1 == stoneRow) {
                if stoneRow + 1 > 8  || stoneColIndex-1 < 0   { return false }
                stone[0] = col[stoneColIndex-1]
                stone[1] = String(stoneRow+1)
            }
            king[0] = col[kingColIndex-1]
            king[1] = String(kingRow+1)
            
            return true
        }
    }
    
    private func solution2() {
        enum Direction: String {
            case r, l, b, t
            case rt, lt, rb, lb
        }
        
        struct Chess: Equatable {
            var row: Int
            var col: Int
            
            init(_ row: Int, _ col: Int) {
                self.row = row
                self.col = col
            }
            
            func isValidMovement(_ command: Direction) -> Bool {
                let move = move(to: command)
                let (row, col) = (move.row, move.col)
                
                if (1...8) ~= row && (0..<8) ~= col {
                    return true
                }
                
                return false
            }
            
            func move(to command: Direction) -> Chess {
                switch command {
                case .r: return Chess(row, col+1)
                case .l: return Chess(row, col-1)
                case .b: return Chess(row-1, col)
                case .t: return Chess(row+1, col)
                case .rt: return Chess(row+1, col+1)
                case .lt: return Chess(row+1, col-1)
                case .rb: return Chess(row-1, col+1)
                case .lb: return Chess(row-1, col-1)
                }
            }
        }
        
        let conditions = readLine()!.split(separator: " ").map { String($0) }
        let king = conditions[0].map { String($0) }
        let stone = conditions[1].map { String($0) }
        guard let n = Int(conditions[2]) else { return }
        
        let col = Array("ABCDEFGH").map { String($0) }
        
        guard let kingColIndex = col.firstIndex(of: king[0]) else { return }
        guard let kingRowIndex = Int(king[1]) else { return }
        guard let stoneColIndex = col.firstIndex(of: stone[0]) else { return }
        guard let stoneRowIndex = Int(stone[1]) else { return }
        
        var chessKing = Chess(kingRowIndex, kingColIndex)
        var chessStone = Chess(stoneRowIndex, stoneColIndex)
        
        for _ in 0..<n {
            let command = readLine()!.lowercased()
            guard let direction = Direction(rawValue: command) else { continue }
            
            if chessKing.isValidMovement(direction) {
                let movedKingLocation = chessKing.move(to: direction)
                
                if movedKingLocation == chessStone {
                    if chessStone.isValidMovement(direction) {
                        let movedStoneLocation = chessStone.move(to: direction)
                        chessStone = Chess(movedStoneLocation.row, movedStoneLocation.col)
                    } else {
                        continue
                    }
                }
                chessKing = Chess(movedKingLocation.row, movedKingLocation.col)
            }
        }
        print(col[chessKing.col] + String(chessKing.row))
        print(col[chessStone.col] + String(chessStone.row))
    }
}
