/**
 * https://leetcode.com/problems/diagonal-traverse/
 * 
 * 
 */ 
// Date: Sat Dec 26 18:39:05 PST 2020
class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        let n = matrix.count
        guard let m = matrix.first?.count else { return [] }
        var result = [Int]()
        var x = 0
        var y = 0
        var dx = [-1, 1]
        var dy = [1, -1]
        var index = 0
        var count = n * m
        repeat {
            // print(matrix[x][y])
            result.append(matrix[x][y])
            count -= 1
            let nextX = x + dx[index]
            let nextY = y + dy[index]
            if nextX >= 0, nextX < n, nextY >= 0, nextY < m {
                x = nextX
                y = nextY
            } else {
                if index == 0 {
                    if y + 1 < m {
                        y += 1
                    } else {
                        x += 1
                    }
                } else {
                    if x + 1 < n {
                        x += 1
                    } else {
                        y += 1
                    }
                }
                index = 1 - index
            }
        } while count > 0
        return result
    }
}