import Foundation

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

func part1(input: [String]) -> Int {
    func parse(_ rawData: [String]) -> [(CGPoint, CGPoint)] {
        var points = [(CGPoint, CGPoint)]()
        var pointStore = (CGPoint(), CGPoint())
        for (i, val) in rawData[1...].filter({$0 != "->"}).enumerated() {
            let coordinates = val.split(separator: ",").compactMap({Int($0)})
            if i % 2 == 0 {
                if i > 0 { points.append(pointStore) }
                pointStore.0 = CGPoint(x: coordinates.first!, y: coordinates.last!)
            } else {
                pointStore.1 = CGPoint(x: coordinates.first!, y: coordinates.last!)
            }
        }
        points.append(pointStore)
        return points
    }
    
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
    return dangerousPoints.count
}

let input = CommandLine.arguments
print(part1(input: input))
