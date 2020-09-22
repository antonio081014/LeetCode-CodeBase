/**
 * https://leetcode.com/problems/majority-element/
 * 
 * 
 */ 
// Date: Tue Sep 22 09:28:10 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(1)
    func majorityElement(_ nums: [Int]) -> Int {
        var result = nums[0]
        var count = 1
        for index in stride(from: 1, to: nums.count, by: 1) {
            if count == 0 {
                result = nums[index]
                count = 1
            } else if result == nums[index] {
                count += 1
            } else {
                count -= 1
            }
        }
        return result
    }
}