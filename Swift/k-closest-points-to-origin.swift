/**
 * https://leetcode.com/problems/k-closest-points-to-origin/
 * 
 * 
 */ 
// Date: Sat May 30 09:18:01 PDT 2020
class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        let p = points.sorted(by: { p1, p2 in
                                   return p1[0]*p1[0] + p1[1]*p1[1] < p2[0]*p2[0] + p2[1]*p2[1]
                                  })
        return Array(p[0 ..< K])
    }
}
