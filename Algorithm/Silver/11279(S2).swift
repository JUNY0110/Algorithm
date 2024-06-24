//
//  11279.swift
//  Algorithm
//
//  Created by 지준용 on 6/24/24.
//

import Foundation

// MARK: - 최대 힙(우선순위 큐)
final class BaekJoon11279 {
    func run() {
        solution2()
    }
    
    struct FileIO {
        private let buffer:[UInt8]
        private var index: Int = 0

        init(fileHandle: FileHandle = FileHandle.standardInput) {
            buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        }

        @inline(__always) private mutating func read() -> UInt8 {
            defer { index += 1 }

            return buffer[index]
        }

        @inline(__always) mutating func readInt() -> Int {
            var sum = 0
            var now = read()
            var isPositive = true

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시
            if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
            while now >= 48, now <= 57 {
                sum = sum * 10 + Int(now-48)
                now = read()
            }

            return sum * (isPositive ? 1:-1)
        }
    }
    
    enum MoveDownStatus {
        case none, left, right
    }
    
    struct Heap<T: Comparable> {
        var heap: [T] = []
        
        init() {}
        
        init(data: T) {
            heap.append(data)
            heap.append(data)
        }
        
        mutating func insert(_ data: T) {
            if heap.isEmpty {
                heap.append(data)
                heap.append(data)
                return
            }
            heap.append(data)
            
            func isMoveUp(_ insertIndex: Int) -> Bool {
                if insertIndex <= 1 { return false }
                
                let parentIndex = insertIndex / 2
                
                return heap[insertIndex] > heap[parentIndex] ? true : false
            }
            
            var insertIndex = heap.count-1
            
            while isMoveUp(insertIndex) {
                let parentIndex = insertIndex / 2
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        mutating func pop() -> T? {
            if heap.count <= 1 { return nil }
            
            let maxValue = heap[1]
            heap.swapAt(1, heap.count - 1) // 맨 앞에 위치한 최대값을 빠르게 제거하기 위해 맨 뒤로 보낸다.
            heap.removeLast()     // 최대값(RootNode) 제거
            
            func moveDown(_ poppedIndex: Int) -> MoveDownStatus {
                let leftChildIndex = poppedIndex * 2
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex >= heap.count { // 자식노드가 없는 경우.
                    return .none
                }
                
                if rightChildIndex >= heap.count { // 왼쪽 자식노드만 있는 경우. (현재 값이 자식노드보다 작은지 판단. 작으면 왼쪽으로 내려감.)
                    return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
                }
                
                if heap[leftChildIndex] < heap[poppedIndex] && heap[rightChildIndex] < heap[poppedIndex] { // 모든 자식들이 현재 노드보다 작은 경우
                    return .none
                }
                
                if heap[leftChildIndex] > heap[poppedIndex] && heap[rightChildIndex] > heap[poppedIndex] { // 모든 자식들이 현재 노드보다 큰 경우
                    return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
                }
                
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right // 자식 중 한 쪽만 큰 경우
            }
            
            var poppedIndex = 1 // 현재 RootNode에 있는 값의 위치
            
            while true {// RootNode에 최대값이 올라올 때까지 반복
                switch moveDown(poppedIndex) {
                case .none:
                    return maxValue
                case .left:
                    let leftChildIndex = poppedIndex * 2
                    heap.swapAt(poppedIndex, leftChildIndex)
                    poppedIndex = leftChildIndex
                case .right:
                    let rightChildIndex = (poppedIndex * 2) + 1
                    heap.swapAt(poppedIndex, rightChildIndex)
                    poppedIndex = rightChildIndex
                }
            }
        }
    }
    
    private func solution() {
        var fileIO = FileIO()
        let n = fileIO.readInt()
        var heap = Heap<Int>()
        
        for _ in 0..<n {
            let x = fileIO.readInt() // x가 0이면 가장 큰 값 출력, 자연수이면 배열에 해당 값을 추가하는 연산.
            
            if x == 0 {
                print(heap.pop() ?? 0)
            } else {
                heap.insert(x)
            }
        }
    }
    
    
    struct Heap2<T: Comparable> {
        private var heap: [T] = []
        private let comparer: (T, T) -> Bool
        
        init(comparer: @escaping (T, T) -> Bool) {
            self.comparer = comparer
        }
        
        mutating func insert(data: T) {
            if heap.isEmpty {
                heap.append(data)
                heap.append(data)
                return
            }
            
            heap.append(data)
            
            func isMoveUp(_ insertIndex: Int) -> Bool{
                if insertIndex <= 1 { return false }
                
                let parentIndex = insertIndex / 2
                
                return comparer(heap[insertIndex], heap[parentIndex])
            }
            
            var insertIndex = heap.count - 1
            
            while isMoveUp(insertIndex) {
                let parentIndex = insertIndex / 2
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        mutating func pop() -> T? {
            if heap.count <= 1 { return nil }
            
            heap.swapAt(1, heap.count-1)
            let maxValue = heap.removeLast()
            
            func reorder(_ poppedIndex: Int) {
                var swapIndex = poppedIndex
                var isSwap = false
                let leftIndex = poppedIndex * 2
                let rightIndex = leftIndex + 1
                
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
                    reorder(swapIndex)
                }
            }
            
            reorder(1)
            
            return maxValue
        }
    }
    
    private func solution2() {
        let n = Int(readLine()!)!
        var heap = Heap2<Int>(comparer: >)
        
        for _ in 0..<n {
            let x = Int(readLine()!)! // x가 0이면 가장 큰 값 출력, 자연수이면 배열에 해당 값을 추가하는 연산.
            
            if x == 0 {
                print(heap.pop() ?? 0)
            } else {
                heap.insert(data: x)
            }
        }
    }
}
