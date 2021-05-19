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
