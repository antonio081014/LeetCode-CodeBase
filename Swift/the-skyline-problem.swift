/**
 * https://leetcode.com/problems/the-skyline-problem/
 * 
 * 
 */ 
// Date: Wed Sep  9 11:00:39 PDT 2020
/// 
/// 
struct Point {
    enum Operation {
        case add
        case remove
    }

    let position: Int
    let height: Int
    let operation: Operation
}

extension Point: Comparable {
    static func < (lhs: Point, rhs: Point) -> Bool {
        // 1. let smaller position comes first.
        if lhs.position != rhs.position { return lhs.position < rhs.position }
        // 2. if this position is the start of two rectangles, higher rect comes first.
        if lhs.operation == .add, rhs.operation == .add { return rhs.height < lhs.height }
        // 3. if this position is the end of two rectangles, lower ones should be handled first.
        if lhs.operation == .remove, rhs.operation == .remove { return rhs.height > lhs.height }
        // 4. handle start of a rectangle before remove one.
        return lhs.operation == .add
    }
}

/// Sorted Array.
/// Maintaining a bunch of comparable elements in a list.
/// Add / Remove could cost O(logn) with binary search.
///
/// PS: add actually cost O(n), because using `insert`.
struct SortedArray<T: Comparable> {
    private var elements: [T]

    init() {
        self.elements = []
    }

    mutating func add(_ element: T) {
        var left = 0
        var right = self.elements.count
        while left < right {
            let mid = left + (right - left) / 2
            if self.elements[mid] < element {
                left = mid + 1
            } else {
                right = mid
            }
        }
        // But this actually cost O(n).
        self.elements.insert(element, at: left)
    }

    mutating func remove(_ element: T) {
        var left = 0
        var right = self.elements.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if self.elements[mid] == element {
                self.elements.remove(at: mid)
                return
            } else if self.elements[mid] < element {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }

    var maxValue: T? {
        return self.elements.last
    }

    var isEmpty: Bool {
        return self.elements.isEmpty
    }
}

class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var activeHeights = SortedArray<Int>()
        var criticalPoint = [Point]()
        for building in buildings {
            let start = building[0]
            let end = building[1]
            let height = building[2]
            criticalPoint.append(Point(position: start, height: height, operation: .add))
            criticalPoint.append(Point(position: end, height: height, operation: .remove))
        }
        criticalPoint.sort()

        var result: [[Int]] = []
        var lastHeight: Int? = nil
        for point in criticalPoint {
            switch point.operation {
                case .add:
                    activeHeights.add(point.height)
                    if lastHeight == nil || lastHeight! < activeHeights.maxValue! {
                        lastHeight = activeHeights.maxValue
                        result.append([point.position, activeHeights.maxValue!])
                    }
                break
                case .remove:
                    activeHeights.remove(point.height)
                    if activeHeights.isEmpty {
                        lastHeight = nil
                        result.append([point.position, 0])
                    } else {
                        if lastHeight! != activeHeights.maxValue! {
                            lastHeight = activeHeights.maxValue
                            result.append([point.position, lastHeight!])
                        }
                    }
                    break
            }
        }
        return result
    }
}

