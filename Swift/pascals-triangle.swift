/**
 * https://leetcode.com/problems/pascals-triangle/
 * 
 * 
 */ 
// Date: Tue Apr 21 14:02:24 PDT 2020
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = []
        for row in 0 ..< numRows {
            var list = [1]
            if let last = result.last {
                for index in 0 ..< row {
                    let sum = last[index] + (index + 1 < last.count ? last[index + 1] : 0)
                    list.append(sum)
                }
            }
            result.append(list)
        }
        return result
    }
}
