/**
 * https://leetcode.com/problems/max-consecutive-ones-iii/
 * 
 * 
 */ 
// Date: Tue Jun 29 16:21:26 PDT 2021
class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var start = 0
        var result = 0
        var K = 0
        for end in 0 ..< nums.count {
            if nums[end] == 0 { K += 1 }
            if K > k {
                if nums[start] == 0 { K -= 1 }
                start += 1
            }
            print(start, end)
            result = max(result, end - start + 1)
        }
        return result
    }
}