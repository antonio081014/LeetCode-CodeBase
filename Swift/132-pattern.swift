/**
 * https://leetcode.com/problems/132-pattern/
 * 
 * 
 */ 
// Date: Fri Oct 30 15:40:53 PDT 2020
class Solution {
    /// - Complexity: O(n^2). TLE
    func find132pattern(_ nums: [Int]) -> Bool {
        let n = nums.count
        var leftMin = nums[0]
        for index in stride(from: 1, to: n - 1, by: 1) {
            if nums[index] > leftMin {
                for right in stride(from: index + 1, to: n, by: 1) {
                    if nums[right] < nums[index], nums[right] > leftMin { return true}
                }
            }
            leftMin = min(leftMin, nums[index])
        }
        return false
    }
}


/**
 * https://leetcode.com/problems/132-pattern/
 * 
 * 
 */ 
// Date: Fri Oct 30 15:51:12 PDT 2020
class Solution {
    /// - Complexity: 
    ///     - Time: O(n), n is nums.count
    ///     - Space: O(n), to store the leftMin and possible right ends in stack.
    func find132pattern(_ nums: [Int]) -> Bool {
        let n = nums.count
        var leftMin = nums
        for index in stride(from: 1, to: n, by: 1) {
            leftMin[index] = min(leftMin[index - 1], nums[index])
        }
        
        var stack = [Int]()
        for index in stride(from: n - 1, through: 0, by: -1) {
            if nums[index] > leftMin[index] {
                // We see 1 and 3, seeking 2.
                while let last = stack.last, last <= leftMin[index] {
                    stack.removeLast()
                }
                // Validate the 2.
                if let last = stack.last, last < nums[index] { return true }
                // nums[index] > min value, so this might be the 2 for the other tuples.
                stack.append(nums[index])
            }
        }
        return false
    }
}


