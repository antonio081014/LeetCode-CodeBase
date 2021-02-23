/**
 * https://leetcode.com/problems/search-a-2d-matrix-ii/
 * 
 * 
 */ 
// Date: Tue Feb 23 08:21:00 PST 2021
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 { return false }
        var row = matrix.count - 1
        var col = 0
        while col < matrix[0].count, row >= 0 {
            if matrix[row][col] == target { return true }
            if matrix[row][col] > target { row -= 1 }
            else { col += 1 }
        }
        return false
    }
}

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 { return false }
        var row = 0
        var col = matrix[0].count - 1
        while row < matrix.count, col >= 0 {
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] > target {
                col -= 1
            } else {
                row += 1
            }
        }
        return false
    }
}
