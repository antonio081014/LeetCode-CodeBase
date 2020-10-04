/**
 * https://leetcode.com/problems/remove-covered-intervals/
 * 
 * 
 */ 
// Date: Sun Oct  4 10:24:29 PDT 2020
class Solution {
    func removeCoveredIntervals(_ inter: [[Int]]) -> Int {
        let intervals = inter.sorted { (a, b) in
            if a[0] == b[0] { return a[1] >= b[1] }
            return a[0] < b[0]
        }
        // print("\(intervals)")
        var rightEnd = 0
        var result = 1
        for index in stride(from: 1, to: intervals.count, by: 1) {
            if intervals[index][1] > intervals[rightEnd][1] {
                result += 1
                rightEnd = index
            }
        }
        return result
    }
}