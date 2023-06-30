//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/30.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let wallpaper = readLine()!.split(separator: " ").map { String($0) }
        print(solution1(wallpaper))
    }
    
    func solution1(_ wallpaper:[String]) -> [Int] {
        var (lux, luy) = (50, 50)
        var (rdx, rdy) = (-1, -1)

        for (i, str) in wallpaper.enumerated() {
            if str.contains("#") {
                lux = min(lux, i)
                rdx = max(rdx, i)
            }
            
            for (j, file) in str.enumerated() {
                if file == "#" {
                    luy = min(luy, j)
                    rdy = max(rdy, j)
                }
            }
        }
        return [lux, luy, rdx+1, rdy+1]
    }
    
    func solution2(_ wallpaper:[String]) -> [Int] {
        // 맨 위의 #
        // 맨 왼쪽의 #
        // 맨 오른쪽의 #
        // 맨 아래쪽의 #
        let wallpaper = wallpaper.map { String($0).map{String($0)} }
        var (lux, luy) = (51,51)
        var (rdx, rdy) = (0, 0)
        var isFirst = true

        for i in 0..<wallpaper.count {
            guard let l = wallpaper[i].firstIndex(of: "#"),
                  let r = wallpaper[i].lastIndex(of: "#") else { continue }

            if isFirst && wallpaper[i].contains("#") {
                lux = i
                isFirst = false
            }

            if l < luy {
                luy = l
            }

            if r > rdy {
                rdy = r
            }

            if wallpaper[i].contains("#") {
                rdx = i
            }
        }
        return [lux, luy, rdx+1, rdy+1]
    }
}
