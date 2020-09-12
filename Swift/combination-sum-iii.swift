/**
 * https://leetcode.com/problems/combination-sum-iii/
 * 
 * 
 */ 
// Date: Sat Sep 12 13:01:23 PDT 2020
class Solution {
    /// As a combination problem,
    /// - Complexity:
    ///     - Time: O(C(9, k))
    ///     - Space: O(k), since it would never go deeper than k steps.
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var result = [[Int]]()
        func dfs(_ numbers: [Int], _ sum: Int) {
            if numbers.count == k, sum == n {
                result.append(numbers)
                return
            }
            if sum > n { return }
            if numbers.count >= k { return }
            let start = numbers.last ?? 0
            if start >= 10 { return }
            for next in start + 1 ..< 10 {
                dfs(numbers + [next], sum + next)
            }
        }
        dfs([], 0)
        return result
    }
}