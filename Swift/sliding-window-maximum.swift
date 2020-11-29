/**
 * https://leetcode.com/problems/sliding-window-maximum/
 * 
 * 
 */ 
// Date: Sun Nov 29 11:30:11 PST 2020
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var queue: [Int] = []
        var result: [Int] = []
        for index in 0 ..< nums.count {
            while let first = queue.first, first + k <= index {
                queue.removeFirst()
            }
            while let last = queue.last, nums[last] < nums[index] {
                queue.removeLast()
            }
            queue.append(index)
            if index >= k - 1 {
                result.append(nums[queue.first!])
            }
        }
        return result
    }
}