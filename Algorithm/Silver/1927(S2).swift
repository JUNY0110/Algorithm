//
//  1927.swift
//  Algorithm
//
//  Created by 지준용 on 6/24/24.
//

import Foundation

// MARK: - 최소 힙(우선순위 큐)
final class BaekJoon1927 {
    func run() {
        solution()
    }
    
    struct Heap<T: Comparable> {
        private var heap: [T] = []
        private let comparer: (T, T) -> Bool
        
        init(comparer: @escaping (T,T) -> Bool) {
            self.comparer = comparer
        }
        
        mutating func insert(_ data: T) {
            if heap.isEmpty {
                heap.append(data)
                heap.append(data)
                return
            }
            
            heap.append(data)
            
            func isMove(_ insertIndex: Int) -> Bool {
                if insertIndex <= 1 { return false }
                
                let parentIndex = insertIndex / 2
                
                return comparer(heap[insertIndex], heap[parentIndex])
            }
            
            var insertIndex = heap.count-1
            
            while isMove(insertIndex) {
                let parentIndex = insertIndex / 2
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        
        mutating func pop() -> T? {
            if heap.count <= 1 { return nil }
            
            heap.swapAt(1, heap.count - 1)
            let value = heap.removeLast()
            
            func reoreder(_ poppedIndex: Int) {
                var swapIndex = poppedIndex
                let leftIndex = poppedIndex * 2
                let rightIndex = leftIndex + 1
                var isSwap = false
                
                if leftIndex < heap.count && comparer(heap[leftIndex], heap[swapIndex]) {
                    swapIndex = leftIndex
                    isSwap = true
                }
                
                if rightIndex < heap.count && comparer(heap[rightIndex], heap[swapIndex]) {
                    swapIndex = rightIndex
                    isSwap = true
                }
                
                if isSwap {
                    heap.swapAt(swapIndex, poppedIndex)
                    reoreder(swapIndex)
                }
            }
            
            reoreder(1)
            
            return value
        }
    }
    
    
    private func solution() {
        let n = Int(readLine()!)!
        var heap = Heap<Int>(comparer: <)
        
        for _ in 0..<n {
            let x = Int(readLine()!)!
            
            if x == 0 { // 출력
                print(heap.pop() ?? 0)
            } else { // 추가
                heap.insert(x)
            }
        }
    }
}
