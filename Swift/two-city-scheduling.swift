/**
 * https://leetcode.com/problems/two-city-scheduling/
 * 
 * 
 */ 
// Date: Wed Jun  3 10:14:05 PDT 2020
class Solution {
    /// Sort the city traveling cost by its cost difference.
    /// Then, we add the cost of first n people going to city A, and the rest of people going to city B.
    /// - Complexity:
    ///     - Time: O(nlogn), n is the number of people in the array.
    ///     - Space: O(n), since we copy and sort the original array.
    ///
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let costs = costs.sorted { ($0[0] - $0[1]) < ($1[0] - $1[1]) }
        var minCost = 0
        for index in 0 ..< costs.count / 2 {
            minCost += costs[index][0]
            minCost += costs[costs.count - 1 - index][1]
        }
        return minCost
    }
}
