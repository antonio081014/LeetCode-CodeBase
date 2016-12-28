/**
 * https://leetcode.com/problems/arithmetic-slices/
 * 
 * 
 */ 
class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
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
