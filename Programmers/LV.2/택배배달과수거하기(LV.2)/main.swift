//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/13.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let cap = Int(readLine()!)!
        let n = Int(readLine()!)!
        let deliveries = readLine()!.split(separator: " ").compactMap { Int($0) }
        let pickups = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))
    }
    
    func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
        // cap = 최대 수용가능한 택배상자
        // n = 집 갯수
        // deliveries = 집마다 배달해야할 물건들
        // pickups = 집마다 가져와야할 빈상자들

        var deliveries = deliveries
        var pickups = pickups
        var d = 0
        var p = 0
        var distance = 0
        var i = n-1
        
        while i >= 0 {
            if deliveries[i] == 0 && pickups[i] == 0 {
                i -= 1
                continue
            }
            
            if d < deliveries[i] || p < pickups[i] {
                d += cap
                p += cap
                distance += (i+1)
                continue
            }
            
            d -= deliveries[i]
            p -= pickups[i]
            i -= 1
        }

        return Int64(distance) * 2
    }
    
    func solution1(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
        var delivery = [Int: Int]()
        var pickup = [Int: Int]()
        
        // 배송지별
        for i in 1...n {
            delivery[i] = deliveries[i-1]
            pickup[i] = pickups[i-1]
        }
        
        
        var n = n
        var distance = 0
        
        while n > 0 {
            var isFirst = true
            var deliveryBoxes = cap
            var emptyBoxes = 0
            
            for i in stride(from: n, to: 0, by: -1) {
                if delivery[i]! != 0 || pickup[i]! != 0 {
                    n = i
                    // print("This is 다음 갈 집!: \(n)")
                    break
                }
                n = 0
                // print("This is 다음 갈 집은 없다!: \(n)")
            }
            
            // 가장 멀리있는 배송지 거리 체크
            if isFirst {
                isFirst = false
                distance += n * 2
            }
            
            for i in stride(from: n, to: 0, by: -1) {
                if deliveryBoxes <= 0 && emptyBoxes >= cap { break }
                
                // print("\(i)번째")
                // 배송과 수거 현황 체크
                if deliveryBoxes > 0 {
                    deliveryBoxes -= delivery[i]!
                    // print("will deliver 배달: \(delivery[i]!)")
                    delivery[i]! = (deliveryBoxes >= 0) ? 0 : (-deliveryBoxes)
                    // print("did deliver배달: \(delivery[i]!)")
                }
                if emptyBoxes < cap {
                    emptyBoxes += pickup[i]!
                    // print("will get 빈상자: \(pickup[i]!)")
                    pickup[i]! = (emptyBoxes <= cap) ? 0 : (emptyBoxes - cap)
                    // print("did get 빈상자: \(pickup[i]!)")
                }
                // print()
                if i == 1 && (delivery[1]! == 0 || pickup[1]! == 0) { break }
            }
            // print("====================")
        }
        
        return Int64(distance)
    }
    
    func solution2(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
        var deliveries = [0] + deliveries
        var pickups = [0] + pickups
        var n = n
        var distance = 0

        while n > 0 {
            var (deliveryBoxes, emptyBoxes) = (cap, 0)
            var isFirst = true
            
            for i in stride(from: n, through: 0, by: -1) {
                if deliveries[i] != 0 || pickups[i] != 0 {
                    n = i
                    break
                }
                n = 0
            }
            
            if isFirst {
                isFirst = false
                distance += n * 2
            }
            
            for i in stride(from: n, through: 0, by: -1) {
                if deliveryBoxes <= 0 && emptyBoxes >= cap { break }
                
                // print("\(i)번째")
                if deliveryBoxes > 0  {
                    deliveryBoxes -= deliveries[i]
                    // print("will deliver배달: \(deliveries[i])")
                    deliveries[i] = (deliveryBoxes >= 0) ? 0 : (-deliveryBoxes)
                    // print("did deliver배달: \(deliveries[i])")
                }
                
                if emptyBoxes < cap {
                    emptyBoxes += pickups[i]
                    // print("will get 빈상자: \(pickups[i])")
                    pickups[i] = (emptyBoxes <= cap) ? 0 : (emptyBoxes - cap)
                    // print("did get 빈상자: \(pickups[i])")
                }
                // print()
            }
            // print("====================")
        }
        // print(distance)
        return Int64(distance)
    }
}
