/**
 * Problem Link: https://leetcode.com/problems/trapping-rain-water-ii/
 *
 *
 */

class Solution {
    
    func trapRainWater(_ heightMap: [[Int]]) -> Int {
        let n = heightMap.count
        if n <= 0 {
            return 0
        }
        let m = heightMap[0].count
        if m <= 0 {
            return 0
        }
        
        var wallMap = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        var queue = [(Int, Int)]()
        
        for i in 0..<m {
            wallMap[0][i] = heightMap[0][i]
            wallMap[n-1][i] = heightMap[n-1][i]
            queue += [(0, i), (n-1, i)]
        }
        for i in 0..<n {
            wallMap[i][0] = heightMap[i][0]
            wallMap[i][m-1] = heightMap[i][m-1]
            queue += [(i, 0), (i, m-1)]
        }
        
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        
        while !queue.isEmpty {
            let (x, y) = queue.popLast()!
            for i in 0..<4 {
                let xx = x + dx[i]
                let yy = y + dy[i]
                if xx < 0 || xx >= n || yy < 0 || yy >= m {
                    continue
                }
                let maxh = max(wallMap[x][y], heightMap[xx][yy])
                if wallMap[xx][yy] > maxh {
                    wallMap[xx][yy] = maxh
                    queue += [(xx, yy)]
                }
                
            }
        }
        
        var total = 0
        for i in 0..<n {
            for j in 0..<m {
                total += wallMap[i][j] - heightMap[i][j]
            }
        }
        return total
    }
    
}
