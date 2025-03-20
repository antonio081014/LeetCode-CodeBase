/**
 * https://leetcode.com/problems/find-missing-and-repeated-values/
 * 
 * 
 */ 
// Date: Wed Mar 19 17:15:24 PDT 2025
class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        var visited = Set<Int>()
        let n = grid.count
        var sum = n * n * (n * n + 1) / 2
        var dup = 0
        for x in 0 ..< n {
            for y in 0 ..< n {
                if visited.contains(grid[x][y]) {
                    dup = grid[x][y]
                } else {
                    sum -= grid[x][y]
                    visited.insert(grid[x][y])
                }
            }
        }
        return [dup, sum]
    }
}
