//
//  14916.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation



final class BaekJoon14916 {
    func run() {
        solution2()
    }
    
    // MARK: - 거스름돈(그리디)
    private func solution() {
        // 거스름돈을 5원과 2원만으로 거슬러줘야할 때
        // 동전 갯수를 최소로 주도록 해라.
        
        var n = Int(readLine()!)! // 거스름돈 액수
        var count = n / 5   // 5원 최대 갯수
        n = n % 5           // 5원으로 거슬러주고 남은 금액
        
        if (count == 0) && (n % 2 != 0) { // 환전불가
            print(-1)
        } else {
            
            while n > 0 {
                if n % 2 != 0 { // 거스름돈이 2원으로 나눠떨어지지 않으면
                    n += 5      // 5원 돌려받고
                    count -= 1
                    continue    // 2원으로 거슬러질 때까지 반복
                }
                
                count += n / 2  // 남은 거스름돈을 2원으로 받음
                n = 0           // 다 받았으니 n = 0
            }
            
            print(count)
        }
    }
    
    private func solution2() {
        var n = Int(readLine()!)! // 거스름돈 액수
        var count = 0
        
        if n == 1 || n == 3 {
            print(-1)
        } else {
            while n % 5 != 0 { // 5원으로 나눠떨어질 때까지
                n -= 2         // 2원씩 거슬러받고
                count += 1
            }
            
            count += n / 5    // 5원을 한번에 거슬러줌.
            
            print(count)
        }
    }
}
