/**
 * https://leetcode.com/problems/maximize-distance-to-closest-person/
 * 
 * 
 */ 
// Date: Thu Oct 29 10:19:34 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is seats.count
    ///     - Space: O(1)
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var maxDist = 0
        var seatCount = 0

        var leftFlag = true
        var leftCount = 0
        var rightCount = 0

        for n in seats {
            if n == 1 {
                maxDist = max(maxDist, seatCount)
                seatCount = 0
                leftFlag = false
                rightCount = 0
            } else {
                seatCount += 1
                if leftFlag { leftCount += 1 }
                rightCount += 1
            }
        }
        return max((maxDist + 1) / 2, max(leftCount, rightCount))
    }
}