/**
 * https://leetcode.com/problems/out-of-boundary-paths/
 * 
 * 
 */ 
// Date: Thu Jun 24 16:28:32 PDT 2021
class Solution {
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        let mod = 1000000007
        var count = Array(repeating: Array(repeating: Array(repeating: -1, count: maxMove + 1), count: n), count: m)

        func find(_ x: Int, _ y: Int, _ moves: Int) -> Int {
            if x < 0 || x >= m || y < 0 || y >= n { return 1 }
            if moves >= maxMove { return 0 }
            if count[x][y][moves] >= 0 { return count[x][y][moves] }

            var result = 0
            let dir = [0, 1, 0, -1, 0]
            for index in 0 ..< 4 {
                let dx = dir[index]
                let dy = dir[index + 1]
                result += find(x + dx, y + dy, moves + 1)
                result %= mod
            }
            count[x][y][moves] = result
            return count[x][y][moves]
        }

        return find(startRow, startColumn, 0)
    }
}
