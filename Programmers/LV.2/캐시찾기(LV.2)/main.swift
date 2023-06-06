//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/05.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let cities = readLine()!.split(separator: " ").map { String($0) }
        let cacheSize = Int(readLine()!)!
        print(solution1(cacheSize, cities))
    }
    // MARK: - ///////////////////////////////////////////////////////////////////////////////////////
    struct LRUCache {
        var cache: [String]
        let index: Int
        let city: String
        
        init(_ city: String, at cache: [String], of cacheSize: Int) {
            self.city = city
            
            self.cache = Array(cache.suffix(cacheSize))
            self.index = cache.lastIndex(of: self.city) ?? 0
        }
    }

    func solution1(_ cacheSize:Int, _ cities:[String]) -> Int {
        let cities = cities.map { String($0.lowercased()) }
        var stack = [String]()
        var time = 0
        
        for city in cities {
            let lruCache = LRUCache(city, at: stack, of: cacheSize)
            
            if lruCache.cache.contains(city) {
                let LRUIndex = lruCache.index
                
                stack.remove(at: LRUIndex)
                time += 1
            } else {
                time += 5
            }
            stack = lruCache.cache
            stack.append(city)
            print(stack)
        }
        
        return time
    }
    
    // MARK: - ///////////////////////////////////////////////////////////////////////////////////////
    func solution2(_ cacheSize:Int, _ cities:[String]) -> Int {
        let cities = cities.map { String($0.lowercased()) }
        var lru = [String]()
        var time = 0

        for city in cities {
            if lru.contains(city) {
                let LRUIndex = lru.firstIndex(of: city)!
                
                lru.remove(at: LRUIndex)
                time += 1
            } else {
                time += 5
            }
            lru.insert(city, at: 0)
            
            if lru.count > cacheSize {
                lru.removeLast()
            }
        }

        return time
    }

    // MARK: - ///////////////////////////////////////////////////////////////////////////////////////
    
    struct LRUCache2 {
        var cache: [String]
        let index: Int
        let city: String
        
        init(_ city: String, at cache: [String], of cacheSize: Int) {
            self.city = city
            
            self.cache = Array(cache.suffix(cacheSize))
            self.index = cache.lastIndex(of: self.city) ?? 0
        }
    }
    
    func solution3(_ cacheSize:Int, _ cities:[String]) -> Int {
        let cities = cities.map { String($0.lowercased()) }
        var lru = [String]()
        var time = 0

        for city in cities {
            let lruCache = LRUCache2(city, at: lru, of: cacheSize)
            if lruCache.cache.contains(city) {
                let lruIndex = lru.lastIndex(of: lruCache.city) ?? 0

                lru.remove(at: lruIndex)
                time += 1
            } else {
                time += 5
            }
            lru.append(city)
            
            if lru.count > cacheSize {
                lru.removeFirst()
            }
        }

        return time
    }
}
