//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 6/5/24.
//

import Foundation


let main = Main()
main.run()

class Main {
    func run() {
        
        let routesArray = [
            [[-20,-15], [-14,-5], [-18,-13], [-5,-3]],
            [[-100,100],[50,170],[150,200],[-50,-10],[10,20],[30,40]],
            [[-2,-1], [1,2],[-3,0]],
            [[0,1], [0,1], [1,2]],
            [[-20,-15], [-14,-5], [-18,-13], [-5,-3]],
            [[-20,-15]],
            [[-20,15], [-14,-5], [-18,-13], [-5,-3]],
            [[-20,15], [-20,-15], [-14,-5], [-18,-13], [-5,-3]]
        ]
        let expectedResults = [2, 4, 2, 1, 2, 1, 2, 2]
        
        for i in 0..<routesArray.count {
            
            let routes = routesArray[i]
            let expectedResult = expectedResults[i]
            
            let output = solution(routes)
            print("예제 \(i+1)번")
            if expectedResult == output {
                print("정답입니다. 정답: \(expectedResult), 출력값: \(output)")
            } else {
                print("오답입니다.")
                print("정답: \(expectedResult), 출력값: \(output)")
            }
            print("====================")
            print()
            
        }
    }
    
    /*
        고속도로를 이용하는 모든 차량이 반드시 한 번은 카메라에 보이도록 설치해야한다.
        각 route는 i번째 차량의 [진입 시점, 진출 시점]이 있다.
        차량의 진입/진출 시점에 카메라가 있어도 카메라를 만난 것으로 간주.
     
        차량 대수 = 1~10000대
        진입/진출시점 = -30_000 ~ 30_000
     */
    
    
    // MARK: - 단속카메라 LV.3. Swift는 억울해
    private func solution(_ routes: [[Int]]) -> Int {
        var routes = routes.sorted(by: {$0[1] < $1[1]}) // 진출시점을 기준으로 오름차순
        var result = [routes.removeFirst()[1]]          // 첫번째 카메라 위치 저장.
        
        for route in routes {
            guard let cameraPosition = result.last else { continue } // 현재 카메라 위치(가장 뒤에 위치한 카메라 위치)
            let entryPoint = route[0] // 진입 시점
            let exitPoint = route[1]  // 진출 시점
            
            if entryPoint > cameraPosition { // 진입구간이 현재 카메라 설치 위치보다 뒤쪽에 위치하면, 카메라 설치.
                result.append(exitPoint)
            }
        }
        
        return result.count
    }
}
