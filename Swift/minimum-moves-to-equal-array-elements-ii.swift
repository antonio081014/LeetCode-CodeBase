/**
 * https://leetcode.com/problems/minimum-moves-to-equal-array-elements-ii/
 * 
 * 
 */ 
class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        let list = nums.sorted()
        let med = list[n/2]
        var total = 0
        for n in list {
            total += abs(n - med)
        }
        return total
    }
}
