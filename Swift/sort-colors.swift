/**
 * https://leetcode.com/problems/sort-colors/
 * 
 * 
 */ 
// Date: Thu Jun 11 09:14:08 PDT 2020
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var r = 0
        var w = 0
        var b = 0
        for c in nums {
            if c == 0 { r += 1 }
            else if c == 1 { w += 1 }
            else if c == 2 { b += 1 }
        }
        for index in 0 ..< nums.count {
            if r > 0 {
                nums[index] = 0
                r -= 1
            } else if w > 0 {
                nums[index] = 1
                w -= 1
            } else if b > 0 {
                nums[index] = 2
                b -= 1
            }
        }
    }
}
