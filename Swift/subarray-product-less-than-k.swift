/**
 * https://leetcode.com/problems/subarray-product-less-than-k/
 * 
 * 
 */ 
// Date: Tue Sep 29 10:35:00 PDT 2020
/// Sliding window.
/// Keep multiply with new number `n`, unless it's greater than k.
/// If it's greater than k, remove previous added number from leftIndex, until prod is less than k.
class Solution {
    /// - Complexity:
    ///     - Time: O(N), where N is the length of nums. left can only be incremented at most N times.
    ///     - Space: O(1)
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 { return 0 }
        let n = nums.count
        var prod = 1
        var count = 0
        var leftIndex = 0
        for (index, n) in nums.enumerated() {
            prod *= n
            while prod >= k {
                prod /= nums[leftIndex]
                leftIndex += 1
            }
            count += index - leftIndex + 1
        }
        return count
    }
}