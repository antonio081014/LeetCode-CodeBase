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

// Fri Mar  4 09:43:02 PST 2022
class Solution {
    /// Use rolling array to save some space here.
    /// cups[current_row][current_col] = cups[current_row - 1][current_col] * 0.5 + cups[current_row - 1][current_col - 1] * 0.5
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var cups = Array(repeating: Array(repeating: Double.zero, count: 100), count: 2)
        cups[0][0] = Double(poured)
        
        for row in stride(from: 1, through: query_row, by: 1) {
            let current = row % 2
            let last = 1 - current
            for col in 0 ..< 100 {
                cups[current][col] = max(0, cups[last][col] - 1) * 0.5
                if col > 0 {
                    cups[current][col] += max(0, cups[last][col - 1] - 1) * 0.5
                }
            }
        }
        return min(1, cups[query_row % 2][query_glass])
    }
}
