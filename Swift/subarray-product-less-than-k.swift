/**
 * https://leetcode.com/problems/subarray-product-less-than-k/
 * 
 * 
 */ 
// Date: Tue Sep 29 10:35:00 PDT 2020
/// Sliding window.
/// Keep multiply with new number `n`, unless it's greater than k.
/// If it's greater than k, remove previous added number from leftIndex, until prod is less than k.
class Solution {
    /// - Complexity:
    ///     - Time: O(N), where N is the length of nums. left can only be incremented at most N times.
    ///     - Space: O(1)
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 { return 0 }
        let n = nums.count
        var prod = 1
        var count = 0
        var leftIndex = 0
        for (index, n) in nums.enumerated() {
            prod *= n
            while prod >= k {
                prod /= nums[leftIndex]
                leftIndex += 1
            }
            count += index - leftIndex + 1
        }
        return count
    }
}/**
 * https://leetcode.com/problems/subarray-product-less-than-k/
 * 
 * 
 */ 
// Date: Tue Sep 29 11:20:53 PDT 2020
/// Binary Search on Logarithms
/// We can reduce the problem to subarray sums instead of subarray products. 
/// The motivation for this is that the product of some arbitrary subarray may be way too large (potentially 1000^50000), 
/// and also dealing with sums gives us some more familiarity as it becomes similar to other problems we may have solved before.
class Solution {
    /// - Complexity:
    ///     - Time: O(nlogn), n is the length of `nums`
    ///     - Space: O(n)
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 { return 0 }
        let k = log(Double(k))
        var prod = [0.0]
        for n in nums {
            prod.append((prod.last ?? 0.0) + log(Double(n)))
        }

        var count = 0
        for end in 1 ... nums.count {
            var left = 0
            var right = end
            while left < right {
                let mid = left + (right - left) / 2
                if prod[end] - prod[mid] >= k - 1e-9 {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            count += end - left
        }
        return count
    }
}

