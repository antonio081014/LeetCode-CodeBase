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
/**
 * https://leetcode.com/problems/rotate-array/
 * 
 * 
 */ 
// Date: Mon May  4 10:06:39 PDT 2020
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}
