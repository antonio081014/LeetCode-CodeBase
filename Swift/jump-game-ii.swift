/**
 * https://leetcode.com/problems/jump-game-ii/
 * 
 * 
 */ 
class Solution {
    ///
    /// Dynamic Programming.
    /// steps[i] = min{ step[j], 0 <= j < i } + 1
    /// - Complexity:
    ///     - Time: O(n^2), n is the number of item in array.
    ///     - Space: O(n), n is the number of item in array.
    ///
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var steps = Array(repeating: Int.max, count: nums.count)
        steps[0] = 0
        for index in 0 ..< nums.count {
            let step = steps[index]
            var offset = 1
            while offset + index < nums.count, offset <= nums[index] {
                steps[offset + index] = min(steps[offset + index], step + 1)
                offset += 1
            }
        }
        return steps[nums.count - 1]
    }
}
