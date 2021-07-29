/**
 * https://leetcode.com/problems/01-matrix/
 * 
 * 
 */ 
// Date: Thu Jul 29 10:01:07 PDT 2021
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let n = mat.count
        guard let m = mat.first?.count else { return [] }
        var result = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        
        var queue: [(x: Int, y: Int)] = []
        for x in 0 ..< n {
            for y in 0 ..< m {
                if mat[x][y] == 0 {
                    result[x][y] = 0
                    queue.append((x, y))
                }
            }
        }
        let dt = [0, 1, 0, -1, 0]
        while queue.isEmpty == false {
            let (x, y) = queue.removeFirst()
            for index in 0 ..< 4 {
                let xx = x + dt[index]
                let yy = y + dt[index + 1]
                if xx >= 0, xx < n, yy >= 0, yy < m, mat[xx][yy] != 0, result[xx][yy] > result[x][y] + 1 {
                    queue.append((xx, yy))
                    result[xx][yy] = 1 + result[x][y]
                }
            }
        }
        return result
    }
}