/**
 * https://leetcode.com/problems/first-bad-version/
 * 
 * 
 */ 
/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        // left will be the index of first element with satisfied requirements.
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) == false {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
