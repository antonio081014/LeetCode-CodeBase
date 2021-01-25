/**
 * https://leetcode.com/problems/check-if-all-1s-are-at-least-length-k-places-away/
 * 
 * 
 */ 
// Date: Mon Jan 25 10:13:51 PST 2021
class Solution {
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        var lastIndex: Int? = nil
        for index in 0 ..< nums.count {
            if nums[index] == 1 {
                if let last = lastIndex, index - last <= k {
                    return false 
                }
                lastIndex = index
            }
        }
        return true
    }
}