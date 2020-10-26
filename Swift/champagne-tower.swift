/**
 * https://leetcode.com/problems/champagne-tower/
 * 
 * 
 */ 
// Date: Mon Oct 26 12:29:43 PDT 2020
class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var fills = Array(repeating: Array(repeating: 0.0, count: query_row + 1), count: query_row + 1)
        fills[0][0] = Double(poured)

        var startRow = 0
        while startRow < query_row {
            startRow += 1
            fills[startRow][0] = max(fills[startRow - 1][0] - 1.0, 0.0) / 2.0
            for index in 1 ... startRow {
                fills[startRow][index] = max(0.0, (fills[startRow - 1][index] - 1.0)) / 2.0 + max(0.0, (fills[startRow - 1][index - 1] - 1.0)) / 2.0
            }
        }
        // print(fills)
        return min(1.0, fills[query_row][query_glass])
    }
}