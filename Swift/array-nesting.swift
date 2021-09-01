/**
 * https://leetcode.com/problems/array-nesting/
 * 
 * 
 */ 
// Date: Wed Sep  1 10:38:30 PDT 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n = nums.count
    ///     - Space: O(n), n = nums.count
    func arrayNesting(_ nums: [Int]) -> Int {
        var visited = Set<Int>()
        let n = nums.count
        var result = 0
        for startIndex in 0 ..< n {
            var start = nums[startIndex]
            if visited.contains(start) { continue }
            visited.insert(start)
            var count = 1
            while visited.contains(nums[start]) == false {
                visited.insert(nums[start])
                count += 1
                start = nums[start]
            }
            result = max(result, count)
        }
        return result
    }
}