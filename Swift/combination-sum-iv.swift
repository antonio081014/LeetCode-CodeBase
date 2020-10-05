/**
 * https://leetcode.com/problems/combination-sum-iv/
 * 
 * 
 */ 
// Date: Mon Oct  5 16:02:29 PDT 2020
class Solution {
    /// count[sum]: number of ways to add numbers to sum.
    /// count[sum] = sum(count[sum - n]), n is the candidates in nums.
    ///
    /// - Complexity:
    ///     - Time: O(target * n)
    ///     - Space: O(target)
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var count = Array(repeating: 0, count: target + 1)
        count[0] = 1
        for sum in 1 ... target {
            for n in nums {
                if sum - n >= 0 {
                    count[sum] = count[sum] &+ count[sum - n]
                }
            }
        }
        return count[target]
    }
}