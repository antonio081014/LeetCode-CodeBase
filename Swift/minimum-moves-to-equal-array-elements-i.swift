/**
 * https://leetcode.com/problems/minimum-moves-to-equal-array-elements-i/
 * 
 * 
 */ 
// Date: Wed May 19 08:51:03 PDT 2021
class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        let med = nums[n / 2]
        let costL = nums.reduce(0) { $0 + abs($1 - med) }
        return costL
    }
}