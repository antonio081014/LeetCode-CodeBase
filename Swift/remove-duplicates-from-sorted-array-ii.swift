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
/**
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
 * 
 * 
 */ 
// Date: Fri Dec 11 09:30:26 PST 2020

