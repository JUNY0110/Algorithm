//
//  6841.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon6841 {
    func run() {
        solution1()
    }
    
    func solution1() {
        while true {
            let input = readLine()!
            switch input {
            case "CU": print("see you")
            case ":-)": print("I’m happy")
            case ":-(": print("I’m unhappy")
            case ";-)": print("wink")
            case ":-P": print("stick out my tongue")
            case "(˜.˜)": print("sleepy")
            case "TA": print("totally awesome")
            case "CCC": print("Canadian Computing Competition")
            case "CUZ": print("because")
            case "TY": print("thank-you")
            case "YW": print("you’re welcome")
            case "TTYL": print("talk to you later")
            default:
                print("\(input)")
            }
            if input == "TTYL" { break }
        }
    }
    
    func solution2() {
        let dict = [
            "CU": "see you",
            ":-)": "I’m happy",
            ":-(": "I’m unhappy",
            ";-)": "wink",
            ":-P": "stick out my tongue",
            "(˜.˜)": "sleepy",
            "TA": "totally awesome",
            "CCC": "Canadian Computing Competition",
            "CUZ": "because",
            "TY": "thank-you",
            "YW": "you’re welcome",
            "SQL": "SQL",
            "LOL": "laughing out loud",
            "TTYL": "talk to you later"
        ]
        
        while true {
            let input = readLine()!
            print(dict[input]!)
            if input == "TTYL" { break }
        }
    }
}
