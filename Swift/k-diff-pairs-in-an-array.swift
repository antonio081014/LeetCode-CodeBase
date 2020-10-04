/**
 * https://leetcode.com/problems/k-diff-pairs-in-an-array/
 * 
 * 
 */ 
// Date: Sat Oct  3 17:20:56 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is nums.count
    ///     - Space: O(n), n is nums.count
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var result: Set<Int> = []
        var set: Set<Int> = []
        for index in 0 ..< nums.count {
            if set.contains(nums[index] - k) {
                result.insert(nums[index] - k)
            } 
            if set.contains(nums[index] + k) {
                result.insert(nums[index])
            }
            set.insert(nums[index])
        }
        return result.count
    }
}