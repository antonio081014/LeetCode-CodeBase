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
/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 * 
 * 
 */ 
// Date: Fri May  1 23:07:50 PDT 2020
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 { return nums.count }
        var start = 1
        for index in 1 ..< nums.count {
            if nums[index] != nums[index - 1] {
                nums[start] = nums[index]
                start += 1
            }
        }
        // print("\(start)")
        return start
    }
}