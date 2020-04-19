/**
 * https://leetcode.com/problems/minimum-path-sum/
 * 
 * 
 */ 

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var mark = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        mark[0][0] = grid[0][0]
        for x in 0 ..< n {
            for y in 0 ..< m {
                if x > 0 {
                    mark[x][y] = min(mark[x - 1][y] + grid[x][y], mark[x][y])
                }
                if y > 0 {
                    mark[x][y] = min(mark[x][y - 1] + grid[x][y], mark[x][y])
                }
            }
        }
        return mark[n - 1][m - 1]
    }
}
///
/// Use rolling array to store tmp sums.
///
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard let m = grid.first?.count else { return 0 }
        var sum = Array(repeating: Array(repeating: 0, count: m), count: 2)
        
        sum[0][0] = grid[0][0]
        for x in 0 ..< n {
            for y in 0 ..< m {
                if x > 0 {
                    sum[x % 2][y] = grid[x][y] + sum[1 - x % 2][y]
                } else if y > 0 {
                    sum[x % 2][y] = Int.max
                }
                if y > 0 {
                    sum[x % 2][y] = min(sum[x % 2][y], grid[x][y] + sum[x % 2][y - 1])
                }
            }
            // print("\(sum)")
        }
        return sum[1 - n % 2][m - 1]
    }
}
