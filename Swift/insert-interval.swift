/**
 * https://leetcode.com/problems/insert-interval/
 * 
 * 
 */ 
// Date: Thu Jul 23 16:32:51 PDT 2020
class Solution {
    /// Go through every interval in intervals
    /// 1. If pair is on left of newInterval, then append the pair to result
    /// 2. If pair is on right of newInterval, then append the newInterval and pair
    ///     ps: set newInterval to empty, once it's been added to the result.
    /// 3. if pair has overlap with newInterval, then merge two and replace newInterval with the merged one.
    /// 
    /// - Complexity:
    ///     - Time: O(n), n is the number of intervals in intervals
    ///     - Space: O(1), if we dont count the return result.
    ///
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {        
        func merge(_ a: [Int], _ b: [Int]) -> [Int] {
            return [min(a[0], b[0]), max(a[1], b[1])]
        }
        var result: [[Int]] = []
        var ainterval: [Int]? = newInterval
        for pair in intervals {
            if let interval = ainterval {
                if pair[1] < interval[0] {
                    result.append(pair)
                } else if pair[0] > interval[1] {
                    result.append(interval)
                    result.append(pair)
                    ainterval = nil
                } else {
                    ainterval = merge(interval, pair)
                }
            } else {
                result.append(pair)
            }
        }
        if let interval = ainterval {
            result.append(interval)
        }
        return result
    }
}
