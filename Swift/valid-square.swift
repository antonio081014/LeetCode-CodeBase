/**
 * https://leetcode.com/problems/valid-square/
 * 
 * 
 */ 
// Date: Wed Nov 11 09:45:43 PST 2020
class Solution {

    private func dist(_ p1: [Int], _ p2: [Int]) -> Int {
        return (p1[0] - p2[0]) * (p1[0] - p2[0]) + (p1[1] - p2[1]) * (p1[1] - p2[1])
    }

    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        let p = [p1, p2, p3, p4].sorted {
            if $0[0] == $1[0] { return $0[1] < $1[1] }
            return $0[0] < $1[0]
        }
        let d1 = dist(p[0], p[1])
        let d2 = dist(p[3], p[1])
        let d3 = dist(p[2], p[3])
        let d4 = dist(p[0], p[2])
        
        let d5 = dist(p[0], p[3])
        let d6 = dist(p[1], p[2])
        
        return d1 > 0 && d1 == d2 && d2 == d3 && d3 == d4 && d4 == d1 && d5 == d6
    }
}

