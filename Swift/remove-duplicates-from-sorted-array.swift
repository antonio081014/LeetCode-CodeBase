/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 * 
 * 
 */ 
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index = 0
        while index + 1 < nums.count {
            if nums[index] == nums[index + 1] {
                nums.remove(at: index + 1)
            } else {
                index += 1
            }
        }
        return nums.count
    }
}
