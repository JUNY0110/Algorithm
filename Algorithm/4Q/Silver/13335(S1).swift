//
//  13335.swift
//  Algorithm
//
//  Created by 지준용 on 11/14/23.
//

import Foundation


final class BaekJoon13335 {
    func run() {
        solution2()
    }
    
    private func solution() {
        struct Queue {
            var queue = [(weight: Int, time: Int)]()
            let time: Int
            
            init(_ time: Int) {
                self.time = time
            }
            
            mutating func enqueue(_ weight: Int) {
                queue.append((weight, 1))
            }
            
            mutating func dequeue() -> [(Int, Int)] {
                var queue = Array(queue.reversed())
                
                guard let truck = queue.last else { return queue }
                
                if truck.time > time {
                    queue.removeLast()
                }
                
                return Array(queue.reversed())
            }
        }
        
        let nwl = readLine()!.split(separator: " ").compactMap { Int($0) }
        let _ = nwl[0] // 트럭 갯수
        let w = nwl[1] // 다리 길이, 트럭 한 대가 다리를 건너는 시간
        let l = nwl[2] // 최대 하중
        var truckWeights = Array(readLine()!.split(separator: " ").compactMap { Int($0) }.reversed())
        var queue = Queue(w)
        var result = 0 // 다리를 건너는 최단 시간
        
        while true {
            result += 1
            
            for i in queue.queue.indices {
                queue.queue[i].time += 1
            }
            
            queue.queue = queue.dequeue()
            
            if let truckWeight = truckWeights.last {
                if queue.queue.map({ $0.weight }).reduce(0,+) + truckWeight <= l {
                    queue.enqueue(truckWeight)
                    truckWeights.removeLast()
                }
            }
            
            if queue.queue.isEmpty { break }
        }
        print(result)
    }
    
    private func solution2() {
        let nwl = readLine()!.split(separator: " ").compactMap { Int($0) }
        let numberOfTrucks = nwl[0] // 트럭 갯수
        let length = nwl[1] // 다리 길이, 트럭 한 대가 다리를 건너는 시간
        let maxWeight = nwl[2] // 최대 하중
        let trucks = readLine()!.split(separator: " ").compactMap { Int($0) }
        var index = 0 // index번째 트럭
        
        var onBridege = Array(repeating: 0, count: length)
        var crossedTrucks = 0
        var result = 0 // 다리를 건너는 최단 시간
        
        while crossedTrucks < numberOfTrucks {
            crossedTrucks += onBridege.removeFirst() > 0 ? 1 : 0
            
            if index < numberOfTrucks && onBridege.reduce(0, +) + trucks[index] <= maxWeight {
                onBridege.append(trucks[index])
                index += 1
            } else {
                onBridege.append(0)
            }
            result += 1
        }
        print(result)
    }
}
