/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array-i/
 * 
 * 
 */ 
// Date: Fri Dec 11 09:27:33 PST 2020
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var lastIndex = 0
        var count = 1
        var index = 1
        var length = nums.count
        while index < nums.count {
            if nums[lastIndex] == nums[index] {
                if count + 1 > 2 {
                } else {
                    count += 1
                    lastIndex += 1
                    nums[lastIndex] = nums[index]
                }
            } else {
                lastIndex += 1
                count = 1
                nums[lastIndex] = nums[index]
            }
            index += 1
        }
        return lastIndex + 1
    }
}