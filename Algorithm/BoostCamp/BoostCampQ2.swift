//
//  BoostCampQ2.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/30.
//

import Foundation

class BoostCampQ2 {
    func run() {
        //        let param0 = readLine()!.split(separator: " ").map { String($0) }
        print(solution(["INT", "INT", "BOOL", "SHORT", "LONG"]))
    }
    // ["INT", "SHORT", "FLOAT", "INT", "BOOL"]
    // ["INT", "INT", "BOOL", "SHORT", "LONG"]
    
    enum Types: String {
        case bool = "BOOL"
        case short = "SHORT"
        case float = "FLOAT"
        case int = "INT"
        case long = "LONG"

        var length: Int {
            switch self {
            case .bool: return 1
            case .short: return 2
            case .float: return 4
            case .int: return 8
            case .long: return 16
            }
        }

        var mark: String {
            switch self {
            case .bool: return String(repeating: "#", count: 1)
            case .short: return String(repeating: "#", count: 2)
            case .float: return String(repeating: "#", count: 4)
            case .int: return String(repeating: "#", count: 8)
            case .long: return String(repeating: "#", count: 16)
            }
        }
    }
    
    func solution(_ param0: [String]) -> String {
        let copyParam = param0.map { Types(rawValue: $0)! }
        let bytes = separatedLine(copyParam)
        
        if bytes.reduce(0, {$0 + ($1 == [.long] ? 16 : 8)  }) > 128 {
            return "HALT"
        }

        var results = [String]()

        for byte in bytes {
            if byte == [.int] && byte == [.long] {
                results.append(byte[0].mark)
                continue
            }
            
            let byteLength = byte.reduce(0, {$0 + $1.length})
            
            if byteLength == 8 {
                let markByte = byte.map { $0.mark }.joined()
                results.append(markByte)
                continue
            }
            
            let byteToMark = convertByteToMark(byte, byteLength)
            
            results.append(byteToMark)
        }
        
        return results.joined(separator: ",")
    }
    
    func separatedLine(_ types: [Types]) -> [[Types]] {
        var lines = [[Types]]()
        var line = [Types]()
        var lineLimit = 8
        
        for t in types {
            if lineLimit >= t.length {
                line.append(t)
                lineLimit -= t.length
            } else {
                if !line.isEmpty {
                    lines.append(line)
                }
                line = [t]
                lineLimit = 8 - t.length
            }
        }
        
        if !line.isEmpty {
            lines.append(line)
        }
        
        return lines
    }
    
    func convertByteToMark(_ byte: [Types], _ byteLength: Int) -> String {
        var word = [String]()
        var nibble = ""
        var nibbleCount: Int { nibble.count }
        
        for b in byte {
            if nibbleCount + b.length <= 4 {
                if nibbleCount % 2 == 1 && (b == .short) {
                    nibble += "."
                }
                nibble += b.mark
            } else {
                if nibbleCount < 4 {
                    nibble += String(repeating: ".", count: 4 - nibbleCount)
                }
                word.append(nibble)
                nibble = b.mark
            }
        }
        
        while nibble.count < 4 {
            nibble += "."
        }
        word.append(nibble)
        
        if word.count == 1 {
            word.append("....")
        }
        
        return word.joined()
    }
}
