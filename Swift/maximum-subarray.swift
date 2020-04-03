/**
 * https://leetcode.com/problems/maximum-subarray/
 * 
 * 
 */ 
class Solution {
    /// - Complexity: O(n), n is the number of elements in the array.
    ///
    /// - Description:
    ///     Here,
    ///     1. sum is the maximum sum ending with element n, inclusive.
    ///     2. compare the maxSum with current sum ending with element n.
    ///     3. if sum is negtive, it will not be helpful for the maximum possible element ending with next element. Then, clear it to zero, 0.
    ///
    ///
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var maxSum = Int.min
        for n in nums {
            sum += n
            maxSum = max(maxSum, sum)
            sum = max(0, sum)
        }
        return maxSum
    }
}
