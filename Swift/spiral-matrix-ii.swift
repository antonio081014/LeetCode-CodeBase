/**
 * https://leetcode.com/problems/spiral-matrix-ii/
 * 
 * 
 */ 
// Date: Mon Dec  7 15:44:48 PST 2020
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        var toVisit: Set<Int> = Set(1 ... n * n)
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        var index = 0
        var num = 1
        var x = 0
        var y = 0
        while toVisit.isEmpty == false {
            toVisit.remove(num)
            
            result[x][y] = num
            num += 1
            
            
            
            let xx = x + dx[index]
            let yy = y + dy[index]

            // print("\(xx) : \(yy) - \(num)")

            if xx >= 0, xx < n, yy >= 0, yy < n, result[xx][yy] == 0 {
                x = xx
                y = yy
            } else {
                num -= 1
                index = (index + 1) % dx.count
            }
        }
        return result
    }
}

