/**
 * Problem Link: https://leetcode.com/problems/perfect-rectangle/
 *
 * Linear Algorithm gives TLE. This Algorithm written in other language could pass.
 *
 * To get the perfect square, there are only 3 kinds of vertices.
 *
 * 1st, final 4 cornor vertices of the square, which connects only one rectangle.
 *
 * 2nd, vertices connect two rectangles.
 *
 * 3rd, vertices connect four rectangles.
 */

class Solution {
    
    struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(_ xx: Int, _ yy: Int) {
            self.x = xx
            self.y = yy
        }
        
        var hashValue: Int {
            return self.x ^ self.y
        }
        
        static func == (lhs: Point, rhs: Point) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }
    
    struct Rectangle {
        private let x1: Int
        private let y1: Int
        private let x2: Int
        private let y2: Int
        
        var p1: Point {
            return Point(x1, y1)
        }
        var p2: Point {
            return Point(x1, y2)
        }
        var p3: Point {
            return Point(x2, y1)
        }
        var p4: Point {
            return Point(x2, y2)
        }
        
        var area: Int {
            return (self.y2 - self.y1) * (self.x2 - self.x1)
        }
        
        var minx: Int {
            return self.x1
        }
        var miny: Int {
            return self.y1
        }
        var maxx: Int {
            return self.x2
        }
        var maxy: Int {
            return self.y2
        }
        
        init(x1: Int, y1: Int, x2: Int, y2: Int) {
            self.x1 = x1
            self.y1 = y1
            self.x2 = x2
            self.y2 = y2
        }
    }
    
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        let rectList = rectangles.map {Rectangle(x1: $0[0], y1: $0[1], x2: $0[2], y2: $0[3])}
        let result: (Int, Int, Int, Int, Int, Set<Point>) = rectList.reduce((Int.max, Int.max, Int.min, Int.min, 0, Set<Point>())) {
            res, rect in
            let (minx, miny, maxx, maxy, s, sset) = res
            var set = sset
            if set.insert(rect.p1).0 == false {
                set.remove(rect.p1)
            }
            if set.insert(rect.p2).0 == false {
                set.remove(rect.p2)
            }
            if set.insert(rect.p3).0 == false {
                set.remove(rect.p3)
            }
            if set.insert(rect.p4).0 == false {
                set.remove(rect.p4)
            }
            return (min(minx, rect.minx), min(miny, rect.miny), max(maxx, rect.maxx), max(maxy, rect.maxy), s + rect.area, set)
        }
        let set = result.5
        let mRect = Rectangle(x1: result.0, y1: result.1, x2: result.2, y2: result.3)
        if set.count != 4 || !set.contains(mRect.p1) || !set.contains(mRect.p2) || !set.contains(mRect.p3) || !set.contains(mRect.p4) {
            return false
        }
        return mRect.area == result.4
    }
    
    func isRectangleCover2(_ rectangles: [[Int]]) -> Bool {
        let rectList = rectangles.map {Rectangle(x1: $0[0], y1: $0[1], x2: $0[2], y2: $0[3])}
        var minx = Int.max
        var miny = Int.max
        var maxx = Int.min
        var maxy = Int.min
        var area = 0
        var set = Set<Point>()
        for rect in rectList {
            if set.insert(rect.p1).0 == false {
                set.remove(rect.p1)
            }
            if set.insert(rect.p2).0 == false {
                set.remove(rect.p2)
            }
            if set.insert(rect.p3).0 == false {
                set.remove(rect.p3)
            }
            if set.insert(rect.p4).0 == false {
                set.remove(rect.p4)
            }
            minx = min(minx, rect.minx)
            miny = min(miny, rect.miny)
            maxx = max(maxx, rect.maxx)
            maxy = max(maxy, rect.maxy)
            area += rect.area
        }
        let mRect = Rectangle(x1: minx, y1: miny, x2: maxx, y2: maxy)
        if set.count != 4 || !set.contains(mRect.p1) || !set.contains(mRect.p2) || !set.contains(mRect.p3) || !set.contains(mRect.p4) {
            return false
        }
        return mRect.area == area
    }
}
