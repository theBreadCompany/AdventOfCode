//
//  day5.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

extension Y2021 {
    
    fileprivate func parse(_ rawData: [String]) -> [(CGPoint, CGPoint)] {
        var points = [(CGPoint, CGPoint)]()
        var pointStore = (CGPoint(), CGPoint())
        for val in rawData {
            let coordinates = val.replacingOccurrences(of: " ", with: "").components(separatedBy: "->").map({$0.split(separator: ",")})
            pointStore.0 = CGPoint(x: Int(coordinates[0][0])!, y: Int(coordinates[0][1])!)
            pointStore.1 = CGPoint(x: Int(coordinates[1][0])!, y: Int(coordinates[1][1])!)
            points.append(pointStore)
        }
        return points
    }
    
    @objc
    func day5part1() -> NSNumber {
        
        func diagramize(data: [(CGPoint, CGPoint)]) -> [CGPoint: Int] {
            var ventPositions = [CGPoint: Int]()
            for pts in data {

                let _pts = ((Int(pts.0.x), Int(pts.0.y)), (Int(pts.1.x), Int(pts.1.y)))
                if _pts.0.0 == _pts.1.0 {
                    let correctRange = _pts.0.1 < _pts.1.1 ? _pts.0.1..._pts.1.1 : _pts.1.1..._pts.0.1
                    Array(correctRange).forEach { yPt in
                        if let p = ventPositions[CGPoint(x: _pts.0.0, y: yPt)] {
                            ventPositions.updateValue(p+1, forKey: CGPoint(x: _pts.0.0, y: yPt))
                        } else {
                            ventPositions.updateValue(1, forKey: CGPoint(x: _pts.0.0, y: yPt))
                        }
                    }
                } else if _pts.0.1 == _pts.1.1 {
                    let correctRange = _pts.0.0 < _pts.1.0 ? _pts.0.0..._pts.1.0 : _pts.1.0..._pts.0.0
                    Array(correctRange).forEach { xPt in
                        if let p = ventPositions[CGPoint(x: xPt, y: _pts.0.1)] {
                            ventPositions.updateValue(p+1, forKey: CGPoint(x: xPt, y: _pts.0.1))
                        } else {
                            ventPositions.updateValue(1, forKey: CGPoint(x: xPt, y: _pts.0.1))
                        }
                    }
                }
            }
            return ventPositions
        }
        
        func getDangerous(from data: [CGPoint: Int], warnAt criticalPoint: Int) -> [CGPoint: Int]{
            return data.filter({$0.value >= criticalPoint})
        }
        
        let data = parse(input)
        let diagramData = diagramize(data: data)
        let dangerousPoints = getDangerous(from: diagramData, warnAt: 2)
        return NSNumber(value: dangerousPoints.count)
    }

    @objc
    func day5part2() -> NSNumber {
        
        func diagramize(data: [(CGPoint, CGPoint)]) -> [CGPoint: Int] {
            var ventPositions = [CGPoint: Int]()
            for pts in data {
                let (dx, dy) = (
                    CGFloat(pts.0.x == pts.1.x ? 0 : pts.0.x < pts.1.x ? 1 : -1),
                    CGFloat(pts.0.y == pts.1.y ? 0 : pts.0.y < pts.1.y ? 1 : -1)
                )
                var _pts = pts.0
                while _pts != pts.1 {
                    ventPositions[_pts] = (ventPositions[_pts] ?? 0) + 1
                    _pts.x += dx
                    _pts.y += dy
                }
                ventPositions[_pts] = (ventPositions[_pts] ?? 0) + 1
            }
            return ventPositions
        }
        
        func getDangerous(from data: [CGPoint: Int], warnAt criticalPoint: Int) -> [CGPoint: Int]{
            return data.filter({$0.value >= criticalPoint})
        }
        
        func visualise(using data: [CGPoint: Int], screensize: (Int, Int)) {
            let _data = data.filter({Int($0.key.x) < screensize.0 && Int($0.key.y) < screensize.1})
            var content = Array(repeating: String(repeating: ".", count: screensize.0), count: screensize.1)
            for i in _data {
                var _content = Array(content[Int(i.key.y)]).map({String($0)})
                _content[Int(i.key.x)] = String(i.value)
                content[Int(i.key.y)] = _content.joined(separator: "")
            }
            print(content.joined(separator: "\n"))
        }
        
        let data = parse(input)
        let diagramData = diagramize(data: data)
        let dangerousPoints = getDangerous(from: diagramData, warnAt: 2)
        //visualise(using: dangerousPoints, screensize: (360, 1000))
        return NSNumber(value: dangerousPoints.count)
    }
}
