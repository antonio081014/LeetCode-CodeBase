/**
 * https://leetcode.com/problems/contiguous-array/
 * 
 * 
 */ 
class Solution {
    /// - Complexity: O(n), n is the number of elements in the array.
    func findMaxLength(_ nums: [Int]) -> Int {
        var maxLen = 0
        var sum = 0
        var map: [Int : Int] = [0 : -1]
        for index in 0 ..< nums.count {
            sum += nums[index] == 1 ? 1 : -1
            if let firstPosition = map[sum] {
                maxLen = max(maxLen, index - firstPosition)
            } else {
                map[sum] = index
            }
        }
        
        return maxLen
    }
}
