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
}/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
 * 
 * 
 */ 
// Date: Fri May  1 23:16:18 PDT 2020
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 { return nums.count }
        var startIndex = 1
        var dupCount = 1
        for index in 1 ..< nums.count {
            if nums[index] == nums[index - 1] {
                dupCount += 1
                if dupCount <= 2 {
                    nums[startIndex] = nums[index]
                    startIndex += 1
                }
            } else {
                nums[startIndex] = nums[index]
                startIndex += 1
                dupCount = 1
            }
        }
        return startIndex
    }
}