/**
 * https://leetcode.com/problems/count-elements-with-strictly-smaller-and-greater-elements/
 * 
 * 
 */ 
// Date: Mon Jan 24 11:44:59 PST 2022

class Solution {
    func countElements(_ nums: [Int]) -> Int {
        let maxN = nums.max()!
        let minN = nums.min()!
        return nums.filter { $0 > minN && $0 < maxN }.count
    }
}
