/**
 * https://leetcode.com/problems/132-pattern/
 * 
 * 
 */ 
// Date: Fri Oct 30 15:40:53 PDT 2020
class Solution {
    /// - Complexity: O(n^2). TLE
    func find132pattern(_ nums: [Int]) -> Bool {
        let n = nums.count
        var leftMin = nums[0]
        for index in stride(from: 1, to: n - 1, by: 1) {
            if nums[index] > leftMin {
                for right in stride(from: index + 1, to: n, by: 1) {
                    if nums[right] < nums[index], nums[right] > leftMin { return true}
                }
            }
            leftMin = min(leftMin, nums[index])
        }
        return false
    }
}


