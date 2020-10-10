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
}