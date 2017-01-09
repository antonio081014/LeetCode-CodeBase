/**
 * https://leetcode.com/problems/arithmetic-slices/
 * 
 * 
 */ 
class Solution {
    // Dynamic Programming solution.
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n >= 3 else { return 0 }
        var mark = Array(repeating: 0, count: n)
        var total = 0
        for i in 2..<n {
            if A[i]-A[i-1] == A[i-1]-A[i-2] {
                mark[i] = mark[i-1] + 1
            }
            total += mark[i]
        }
        return total
    }
    // Simplified DP solution.
    func numberOfArithmeticSlices2(_ A: [Int]) -> Int {
        let n = A.count
        guard n >= 3 else { return 0 }
        var c = 0
        var s = 0
        for i in 2..<n {
            if A[i]-A[i-1] == A[i-1]-A[i-2] {
                c += 1
                s += c
            } else {
                c = 0
            }
        }
        return s
    }
}
