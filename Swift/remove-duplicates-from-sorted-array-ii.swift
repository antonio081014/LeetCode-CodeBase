/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
 * 
 * 
 */ 

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var startIndex = 1
        var dups = 1
        while startIndex < nums.count {
            if nums[startIndex] == nums[startIndex - 1] {
                if dups >= 2 {
                    nums.remove(at: startIndex)
                } else {
                    startIndex += 1
                    dups += 1
                }
            } else {
                dups = 1
                startIndex += 1
            }
        }
        return nums.count
    }
}