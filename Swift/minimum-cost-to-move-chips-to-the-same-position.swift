/**
 * https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/
 * 
 * 
 */ 
// Date: Thu Nov  5 10:00:52 PST 2020
class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var odds = 0
        var even = 0
        for p in position {
            if p % 2 == 0 { even += 1}
            else {odds += 1 }
        }
        return min(odds, even)
    }
}/**
 * https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/
 * 
 * 
 */ 
// Date: Thu Nov  5 10:01:09 PST 2020
class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        let count = position.filter { $0 % 2 == 0}.count
        return min(position.count - count, count)
    }
}