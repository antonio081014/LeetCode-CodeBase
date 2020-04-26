/**
 * Problem Link: https://leetcode.com/problems/longest-consecutive-sequence/
 *
 *
 */

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set<Int>(nums)
        var maxn = 0
        
        for x in nums {
            var count = 1
            var left = x - 1
            var right = x + 1
            while (set.contains(left)) {
                count += 1
                set.remove(left)
                left -= 1
            }
            while (set.contains(right)) {
                count += 1
                set.remove(right)
                right += 1
            }
            maxn = max(maxn, count)
        }
        return maxn
    }
}
/**
 * https://leetcode.com/problems/longest-consecutive-sequence/
 * 
 * 
 */ 
// Date: Sun Apr 26 10:30:40 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(n)
    ///     Although the time complexity appears to be quadratic due to the while loop nested within the for loop, closer inspection reveals it to be linear. Because the while loop is reached only when currentNum marks the beginning of a sequence (i.e. currentNum-1 is not present in nums), the while loop can only run for n iterations throughout the entire runtime of the algorithm. This means that despite looking like O( n ⋅ n ) complexity, the nested loops actually run in O(n+n)=O(n) time. All other computations occur in constant time, so the overall runtime is linear.
    ///
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for n in nums {
            set.insert(n)
        }
        
        var longestCS = 0
        for n in set {
            if set.contains(n - 1) == false {
                var count = 1
                var current = n
                while set.contains(current + 1) {
                    current += 1
                    count += 1
                }
                longestCS = max(longestCS, count)
            }
        }
        return longestCS
    }
}
