/**
 * https://leetcode.com/problems/minimum-size-subarray-sum/
 * 
 * 
 */ 
// Date: Wed Dec  9 11:55:41 PST 2020
class Solution {
    func minSubArrayLen(_ K: Int, _ A: [Int]) -> Int {
        var sum = 0
        var window: [Int] = []
        var result = A.count + 1
        for n in A {
            window.append(n)
            sum += n
            while let first = window.first, sum - first >= K {
                window.removeFirst()
                sum -= first
            }
            if sum >= K {
                result = min(result, window.count)
            }
        }
        return result > A.count ? 0 : result
    }
}