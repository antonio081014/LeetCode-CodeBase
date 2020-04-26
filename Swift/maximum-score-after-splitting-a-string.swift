/**
 * https://leetcode.com/problems/maximum-score-after-splitting-a-string/
 * 
 * 
 */ 
// Date: Sat Apr 25 23:29:33 PDT 2020
class Solution {
    func maxScore(_ s: String) -> Int {
        var zeros = [Int]()
        for c in s {
            if String(c) == "0" {
                zeros.append((zeros.last ?? 0) + 1)
            } else {
                zeros.append((zeros.last ?? 0))
            }
        }
        var maxSum = 0
        for split in 1 ..< s.count {
            maxSum = max(maxSum, zeros[split - 1] + s.count - split - (zeros[s.count - 1] - zeros[split - 1]))
        }
        return maxSum
    }
}
