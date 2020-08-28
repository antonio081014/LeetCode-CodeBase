/**
 * https://leetcode.com/problems/minimum-cost-for-tickets/
 * 
 * 
 */ 
// Date: Fri Aug 28 16:06:32 PDT 2020
/// - Complexity:
///     - Time: O(time of converting days into a set + 365)
///     - Space: O(366), store the cost of days from 0 to 365.
///
class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let last = days[days.count - 1]
        var cost = Array(repeating: 0, count: last)
        let days = Set(days)
        for day in 1 ... last {
            if days.contains(day) {
                cost[day] = min(cost[day - 1] + costs[0], min(cost[max(0, day - 7)] + costs[1], cost[max(0, day - 30)] + costs[2]))
            } else {
                cost[day] = cost[day - 1]
            }
        }
        return cost[365]
    }
}