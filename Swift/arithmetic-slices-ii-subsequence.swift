/**
 * https://leetcode.com/problems/arithmetic-slices-ii-subsequence/
 * 
 * 
 */ 
/*
 * https://discuss.leetcode.com/topic/67413/detailed-explanation-for-java-o-n-2-solution
 * This article shows the idea of generalized sequence with two elements only.
 *
 */
class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n>=3 else {return 0}
        var mark = Array(repeating: [Int : Int](), count: n)
        var total = 0
        for i in 1..<n {
            for j in 0..<i {
                let diff = A[i] - A[j]
                if let _ = mark[i][diff] {} else {mark[i][diff] = 0}
                if let _ = mark[j][diff] {} else {mark[j][diff] = 0}
                mark[i][diff] = 1 + mark[j][diff]! + mark[i][diff]!
                total += mark[j][diff]!
            }
            // print("\(A[i]) : \(mark[i])")
        }
        return total
    }
}
print("\(numberOfArithmeticSlices([2,2,3,4]))")
//print("\(numberOfArithmeticSlices([1,2,3,4]))")
//print("\(numberOfArithmeticSlices([2,4,6,8,10]))")
