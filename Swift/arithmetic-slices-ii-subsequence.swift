/**
 * https://leetcode.com/problems/arithmetic-slices-ii-subsequence/
 *
 * https://discuss.leetcode.com/topic/67413/detailed-explanation-for-java-o-n-2-solution
 * This article shows the idea of generalized sequence with two elements only.
 *
 * https://discuss.leetcode.com/topic/66566/can-anyone-explain-the-algorithm-in-words/2
 * This article cleared all the confusion about the generalized sequence idea.
 */
class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n>=3 else {return 0}
        // build dictionary for i, of number of sequences
        // (including length 2) end at i
        var mark = Array(repeating: [Int : Int](), count: n)
        var total = 0
        for i in 1..<n {
            for j in 0..<i {
                // use all j < i to update mark[i][diff]
                // the number of sequences end at i with distance dist
                // add the number of sequences of all dist to ans
                let diff = A[i] - A[j]
                if let _ = mark[i][diff] {} else {mark[i][diff] = 0}
                if let _ = mark[j][diff] {} else {mark[j][diff] = 0}
                // Add elements i to the sequence,
                // Add (A[j], A[i]) as part of solution.
                let s = 1 + mark[j][diff]!
                mark[i][diff] = s + mark[i][diff]!
                total += s
            }
            
            // print("\(A[i]) : \(mark[i])")
            
            // remove the length 2 sequences
            // (A[j], A[i]) for all the j (0...i-1) smaller than i.
            total -= i
        }
        return total
    }
}
print("\(numberOfArithmeticSlices([2,2,3,4]))")
//print("\(numberOfArithmeticSlices([1,2,3,4]))")
//print("\(numberOfArithmeticSlices([2,4,6,8,10]))")
/**
 * https://leetcode.com/problems/arithmetic-slices-ii-subsequence/
 * 
 * 
 */ 
// Date: Sat Sep 11 01:10:39 PDT 2021
class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: [Int : Int](), count: n)
        var result = 0
        for end in stride(from: 1, to: n, by: 1) {
            for start in stride(from: 0, to: end, by: 1) {
                let diff = nums[end] - nums[start]
                if let x = dp[start][diff] {
                    result += x
                }
                dp[end][diff, default: 0] += dp[start][diff, default: 0] + 1
            }
        }
        
        return result
    }
}