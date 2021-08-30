/**
 * https://leetcode.com/problems/range-addition-ii/
 * 
 * 
 */ 
// Date: Mon Aug 30 08:08:47 PDT 2021
class Solution {
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        if ops.count == 0 { return m * n }
        var xmin = Int.max
        var ymin = Int.max
        for op in ops {
            xmin = min(xmin, op[0])
            ymin = min(ymin, op[1])
        }
        return xmin * ymin
    }
}