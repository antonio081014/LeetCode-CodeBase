/**
 * Problem Link: https://leetcode.com/problems/longest-consecutive-sequence/
 *
 *
 */

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set<Int>(nums)
        var maxn = 0
        
        for x in nums {
            var count = 1
            var left = x - 1
            var right = x + 1
            while (set.contains(left)) {
                count += 1
                set.remove(left)
                left -= 1
            }
            while (set.contains(right)) {
                count += 1
                set.remove(right)
                right += 1
            }
            maxn = max(maxn, count)
        }
        return maxn
    }
}
