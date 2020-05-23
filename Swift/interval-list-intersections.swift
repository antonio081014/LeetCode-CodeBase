/**
 * https://leetcode.com/problems/interval-list-intersections/
 * 
 * 
 */ 
// Date: Sat May 23 13:24:00 PDT 2020
class Solution {
    /// Two pointers track on the indices of 2 arrays.
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var ret: [[Int]] = []
        var index1 = 0
        var index2 = 0
        
        while index1 < A.count, index2 < B.count {
            if A[index1][1] < B[index2][0] {
                index1 += 1
            } else if B[index2][1] < A[index1][0] {
                index2 += 1
            } else if A[index1][1] <= B[index2][1], A[index1][0] >= B[index2][0] {
                ret.append(A[index1])
                index1 += 1
            } else if B[index2][1] <= A[index1][1], B[index2][0] >= A[index1][0] {
                ret.append(B[index2])
                index2 += 1
            } else if A[index1][1] <= B[index2][1], A[index1][0] <= B[index2][0] {
                ret.append([B[index2][0], A[index1][1]])
                index1 += 1
            } else if B[index2][1] <= A[index1][1], B[index2][0] <= A[index1][0] {
                ret.append([A[index1][0], B[index2][1]])
                index2 += 1
            }
        }
        return ret
    }
}
