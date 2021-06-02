/**
 * https://leetcode.com/problems/interleaving-string/
 * 
 * 
 */ 
// Date: Wed Jun  2 10:16:40 PDT 2021
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let n1 = s1.count
        let n2 = s2.count
        guard n1 + n2 == s3.count else { return false }
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        var overlap = Array(repeating: Array(repeating: false, count: n2 + 1), count: n1 + 1)
        for x in 0 ... n1 {
            for y in 0 ... n2 {
                if x == 0, y == 0 {
                    overlap[x][y] = true
                } else if x == 0 {
                    overlap[x][y] = overlap[x][y - 1] && (s3[x + y - 1] == s2[y - 1])
                } else if y == 0 {
                    overlap[x][y] = overlap[x - 1][y] && (s3[x + y - 1] == s1[x - 1])
                } else {
                    overlap[x][y] = (overlap[x - 1][y] && (s3[x + y - 1] == s1[x - 1])) || (overlap[x][y - 1] && (s3[x + y - 1] == s2[y - 1]))
                }
            }
        }
        return overlap[n1][n2]
    }
}

