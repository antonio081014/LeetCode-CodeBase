/**
 * https://leetcode.com/problems/perfect-squares/
 * 
 * 
 */ 
// Date: Sat Jun 27 11:19:12 PDT 2020
class Solution {
    func numSquares(_ n: Int) -> Int {
        var steps = Array(repeating: Int.max, count: n + 1)
        steps[0] = 0
        for x in 1 ... n {
            var minStep = steps[x]
            var dx = 1
            while (x - dx * dx) >= 0 {
                minStep = min(minStep, 1 + steps[x - dx * dx])
                dx += 1
            }
            steps[x] = minStep
        }
        
        return steps[n]
    }
}