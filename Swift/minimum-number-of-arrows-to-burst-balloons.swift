/**
 * https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
 * 
 * 
 */ 
// Date: Sat Oct 10 16:35:26 PDT 2020
class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 0 else { return 0 }
        let points = points.sorted(by: {
            if $0[1] != $1[1] { return $0[1] < $1[1] }
            return $0[0] < $1[0]
        })
        // print(points)
        var shots = 1
        var end = points[0][1]
        for index in stride(from: 1, to: points.count, by: 1) {
            if points[index][0] > end {
                end = points[index][1]
                shots += 1
            }
        }
        return shots
    }
}/**
 * https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
 * 
 * 
 */ 
// Date: Thu Jan 13 21:16:33 PST 2022
class Solution {
    struct Balloon: Comparable {
        let start: Int
        let end: Int
        init(_ s: Int, _ e: Int) {
            self.start = s
            self.end = e
        }
        static func < (lhs: Solution.Balloon, rhs: Solution.Balloon) -> Bool {
            if lhs.start != rhs.start { return lhs.start < rhs.start }
            return lhs.end < rhs.end
        }
        
        func overlap(with other: Balloon) -> Balloon? {
            if self.start <= other.start, other.start <= self.end {
                return Balloon(other.start, min(other.end, self.end))
            } else if other.start <= self.start, self.start <= other.end {
                return Balloon(self.start, min(self.end, other.end))
            }
            return nil
        }
    }
    
    /// - Complexity:
    ///     - Time: O(nlogn), where n = points.count, since sorting takes O(nlogn), then uses linear time to count shots.
    ///     - Space: O(n), where n = points.count, construct new array of Balloon.
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let balloons = points.map { Balloon.init($0[0], $0[1]) }.sorted()
        guard var last = balloons.first else { return 0 }
        var result = 1
        for index in stride(from: 1, to: balloons.count, by: 1) {
            if let overlapBalloon = last.overlap(with: balloons[index]) {
                last = overlapBalloon
            } else {
                result += 1
                last = balloons[index]
            }
        }
        return result
    }
}