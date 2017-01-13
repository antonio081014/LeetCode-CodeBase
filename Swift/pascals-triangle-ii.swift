/**
 * https://leetcode.com/problems/pascals-triangle-ii/
 * 
 * 
 */ 

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var rowNum = Array(repeating: Array(repeating: 0, count: rowIndex + 1), count: 2)
        rowNum[0][0] = 1
        var k = 1
        while k <= rowIndex {
            rowNum[k%2][0] = 1
            for j in 1...k {
                rowNum[k%2][j] = rowNum[(k+1)%2][j] + rowNum[(k+1)%2][j-1]
            }
            k += 1
        }
        return rowNum[rowIndex%2]
    }
}
