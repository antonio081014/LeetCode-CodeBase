/**
 * https://leetcode.com/problems/rotate-array/
 * 
 * 
 */ 
class Solution {
    // Complexity:
    // Space: O(k)
    // Time:
    func rotate(_ nums: inout [Int], _ kk: Int) {
        let n = nums.count
        let k = kk % n
        if n==0 || k==0 {return}
        // O(N), N is the length of resulting array.
        // subscript time cost is unknown.
        nums = Array(nums[(n-k)..<n]) + nums
        // O(k)
        nums.dropLast(k)
    }
    
    /// Other solution might use reverse array to solve this problem.
}
