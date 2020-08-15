/**
 * https://leetcode.com/problems/non-overlapping-intervals/
 * 
 * 
 */ 
// Date: Sat Aug 15 12:06:17 PDT 2020
class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 0 else { return 0 }
        let intervals = intervals.sorted(by: {
            if $0[1] == $1[1] {
                return $0[0] < $1[0]
            }
            return $0[1] < $1[1]
        })
        var count = 1
        var end = intervals[0][1]
        for index in 1 ..< intervals.count {
            if end <= intervals[index][0] {
                count += 1
                end = intervals[index][1]
            }
        }
        return intervals.count - count
    }
}
