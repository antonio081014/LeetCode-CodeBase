/**
 * https://leetcode.com/problems/subarray-sum-equals-k/
 * 
 * 
 */ 
// Date: Wed Apr 22 09:38:00 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n^2), n is the number of elements in the array.
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum: [Int] = [0]
        
        for n in nums {
            sum.append((sum.last ?? 0) + n)
        }
        for start in 0 ..< sum.count - 1 {
            for end in start + 1 ..< sum.count {
                if sum[end] - sum[start] == k {
                    count += 1
                }
            }
        }
        return count
    }
}
