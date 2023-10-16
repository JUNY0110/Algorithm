//
//  13777.swift
//  Algorithm
//
//  Created by 지준용 on 10/15/23.
//

import Foundation

final class BaekJoon13777 {
    func run() {
        solution()
    }
    
    class Node {
        let data: Int
        var left: Node?
        var right: Node?
        
        init(data: Int) {
            self.data = data
        }
        
        
    }
    
    class BinarySearchTree {
        var root: Node?
        
        func searchData(_ data: Int) {
            
        }
        
        private func search(_ data: Int) -> Int{
            var currentNode = root
            
            while let node = currentNode {
                if node.data == data {
                    return node.data
                }
                
                if node.data > data {
                    currentNode = node.left
                } else {
                    currentNode = node.right
                }
            }
            return -1
        }
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        let bst = BinarySearchTree()
//        print(bst.search(num))
    }
}
