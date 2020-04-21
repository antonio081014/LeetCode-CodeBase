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
/**
 * https://leetcode.com/problems/pascals-triangle-ii/
 * 
 * 
 */ 
// Date: Tue Apr 21 14:05:17 PDT 2020
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var last: [Int] = []
        for row in 0 ... rowIndex {
            var list = [1]
            if last.isEmpty == false {
                for index in 0 ..< row {
                    let sum = last[index] + (index + 1 < last.count ? last[index + 1] : 0)
                    list.append(sum)
                }
            }
            last = list
        }
        return last
    }
}
