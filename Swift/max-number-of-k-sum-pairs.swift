/**
 * https://leetcode.com/problems/max-number-of-k-sum-pairs/
 * 
 * 
 */ 
// Date: Mon Jan 18 08:52:06 PST 2021
class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var visited: [Int : Int] = [:]
        for x in nums {
            if let c = visited[k - x], c > 0 {
                result += 1
                visited[k - x] = c - 1
            } else {
                visited[x] = 1 + visited[x, default: 0]
            }
        }
        return result
    }
}