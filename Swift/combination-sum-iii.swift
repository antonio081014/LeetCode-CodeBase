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
}/**
 * https://leetcode.com/problems/combination-sum-iii/
 * 
 * 
 */ 
// Date: Mon Oct  5 16:18:19 PDT 2020
class Solution {
    /// BFS
    /// Start with empty list and sum 0.
    /// Then, try to add a number `next`, which is greater than the last one in the list.
    /// iff sum + next <= n.
    ///
    /// - Complexity:
    ///     - Time: O(10 * n), 10 is 0 to 9.
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var queue: [(Int, [Int])] = [(0, [])]
        var result: [[Int]] = []
        
        while queue.isEmpty == false {
            let (sum, list) = queue.removeFirst()
            if list.count == k {
                if sum == n { result.append(list) }
                continue
            }
            let last = list.last ?? 0
            for next in stride(from: last + 1, to: 10, by: 1) {
                if sum + next <= n {
                    queue.append((sum + next, list + [next]))
                }
            }
        }
        return result
    }
}