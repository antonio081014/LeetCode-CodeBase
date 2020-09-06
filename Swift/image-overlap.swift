/**
 * https://leetcode.com/problems/image-overlap/
 * 
 * 
 */ 
// Date: Sun Sep  6 00:42:52 PDT 2020
class Solution {
    func largestOverlap(_ C: [[Int]], _ D: [[Int]]) -> Int {
        func calc(_ A: [[Int]], _ B: [[Int]]) -> Int {
            let n1 = A.count
            let n2 = B.count
            let m1 = A[0].count
            let m2 = B[0].count
            var maxCount = 0
            for x1 in 0 ..< n1 {
                for y1 in 0 ..< m1 {
                    var xx = 0
                    var count = 0
                    while xx + x1 < n1, xx < n2 {
                        var yy = 0

                        while yy + y1 < m1, yy < m2 {
                            // print("\(xx):\(yy) - \(x1):\(y1)")
                            if A[x1 + xx][y1 + yy] == 1, B[xx][yy] == 1 {
                                count += 1
                            }
                            yy += 1
                        }
                        xx += 1
                    }
                    // print("\(x1) - \(y1) : \(count)")
                    maxCount = max(maxCount, count)
                }
            }
            return maxCount
        }
        return max(calc(C, D), calc(D, C))
    }
}