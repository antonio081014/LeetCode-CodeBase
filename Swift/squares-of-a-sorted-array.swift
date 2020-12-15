/**
 * https://leetcode.com/problems/squares-of-a-sorted-array/
 * 
 * 
 */ 
// Date: Tue Dec 15 10:47:42 PST 2020
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map { abs($0) }.sorted().map { $0 * $0 }
    }
}