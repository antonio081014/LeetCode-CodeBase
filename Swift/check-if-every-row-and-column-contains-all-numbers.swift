/**
 * https://leetcode.com/problems/check-if-every-row-and-column-contains-all-numbers/
 * 
 * 
 */ 
// Date: Fri Jan 21 19:44:31 PST 2022
class Solution {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        let n = matrix.count
        for x in 0 ..< n {
            var rows = Set<Int>()
            var cols = Set<Int>()
            for y in 0 ..< n {
                rows.insert(matrix[x][y])
                cols.insert(matrix[y][x])
            }
            if rows.count != n || cols.count != n { return false }
        }
        return true
    }
}