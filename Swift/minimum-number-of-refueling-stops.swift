/**
 * https://leetcode.com/problems/minimum-number-of-refueling-stops/
 * 
 * 
 */ 
// Date: Wed Mar 30 22:13:01 PDT 2022
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n = stations.count
    ///     - Space: O(n), n = stations.count
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        let n = stations.count
        // dp[x]: Farthest distance could be reached by using x stations.
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = startFuel
        for index in 0 ..< n {
            for last in stride(from: index, through: 0, by: -1) {
                if dp[last] >= stations[index][0] {
                    dp[last + 1] = max(dp[last + 1], dp[last] + stations[index][1])
                }
            }
        }
        for index in 0 ... n {
            if dp[index] >= target {
                return index
            }
        }
        return -1
    }
}