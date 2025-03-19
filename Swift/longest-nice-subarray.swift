/**
 * https://leetcode.com/problems/longest-nice-subarray/
 * 
 * 
 */ 
// Date: Wed Mar 19 16:51:42 PDT 2025
class Solution {
    func longestNiceSubarray(_ nums: [Int]) -> Int {
        var maxLength = 0
        var usedBits = 0
        var start = 0
        for end in 0 ..< nums.count {
            // Remove all the elements could have conflicts with current/end element.
            while (usedBits & nums[end]) != 0 {
                usedBits ^= nums[start]
                start += 1
            }
            // print(start, end)
            usedBits |= nums[end]
            maxLength = max(maxLength, end - start + 1)
        }
        return maxLength
    }
}
