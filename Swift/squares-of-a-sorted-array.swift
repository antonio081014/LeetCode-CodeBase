/**
 * https://leetcode.com/problems/squares-of-a-sorted-array/
 * 
 * 
 */ 
// Date: Tue Dec 15 10:47:42 PST 2020
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map { abs($0) }.sorted().map { $0 * $0 }
    }
}/**
 * https://leetcode.com/problems/squares-of-a-sorted-array/
 * 
 * 
 */ 
// Date: Tue Dec 15 10:51:38 PST 2020
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        for index in stride(from: nums.count - 1, through: 0, by: -1) {
            if abs(nums[left]) > abs(nums[right]) {
                result[index] = nums[left] * nums[left]
                left += 1
            } else {
                result[index] = nums[right] * nums[right]
                right -= 1
            }
        }
        return result
    }
}