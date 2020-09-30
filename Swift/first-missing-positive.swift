/**
 * https://leetcode.com/problems/first-missing-positive/
 * 
 * 
 */ 
// Date: Wed Sep 30 10:14:43 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the length of `nums`
    ///     - Space: O(n), n is the length of `nums`
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums + [0]
        let n = nums.count
        for index in 0 ..< n {
            if nums[index] < 0 || nums[index] >= n {
                nums[index] = 0
            }
        }
        for index in 0 ..< n {
            nums[nums[index] % n] += n
        }
        for index in 1 ..< n {
            if nums[index] / n == 0 {
                return index
            }
        }
        return n
    }
}
