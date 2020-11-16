/**
 * https://leetcode.com/problems/longest-mountain-in-array/
 * 
 * 
 */ 
// Date: Mon Nov 16 10:13:17 PST 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n = A.count
    ///     - Space: O(n), n = A.count
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count > 1 else { return 0 }
        var left: [Int] = [0]
        var right: [Int] = [0]
        for index in 1 ..< A.count {
            left.append(A[index] > A[index - 1] ? left[index - 1] + 1 : 0)
            right.append(A[A.count - index - 1] > A[A.count - index] ? right[index - 1] + 1 : 0)
        }
        // print(left)
        // print(right)
        var maxL = 0
        for index in 0 ..< A.count {
            if left[index] > 0, right[A.count - 1 - index] > 0 {
                maxL = max(maxL, left[index] + right[A.count - 1 - index] + 1)
            }
        }
        return maxL
    }
}