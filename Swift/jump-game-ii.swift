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
/**
 * https://leetcode.com/problems/jump-game-ii/
 * 
 * 
 */ 
class Solution {
    func jump(_ nums: [Int]) -> Int {
        /// Steps used to get `lastFurthestPosition`.
        var steps = 0
        /// The furthest possible position could be reached so far by using `Steps` steps.
        var lastFurthestPosition = 0
        /// The furthest possible position could be reached by using 'Steps + 1' steps.
        var nextFurthestPosition = 0
        for index in 0 ..< nums.count {
            // When using `Steps` steps could not reach index
            // We need another step to get to the next possible furthest place.
            if index > lastFurthestPosition {
                steps += 1
                lastFurthestPosition = nextFurthestPosition
            }
            nextFurthestPosition = max(nextFurthestPosition, index + nums[index])
        }
        return steps
    }
}
/**
 * https://leetcode.com/problems/jump-game-ii/
 * 
 * 
 */ 
// Date: Wed May  5 13:24:34 PDT 2021
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var farthestDist = 0
        var steps = 0
        var rangeEnd = 0
        for index in stride(from: 0, to: nums.count - 1, by: 1) {
            farthestDist = max(farthestDist, index + nums[index])
            if rangeEnd == index {
                rangeEnd = farthestDist
                steps += 1
            }
        }
        return steps
    }
}