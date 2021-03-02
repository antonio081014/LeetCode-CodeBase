/**
 * https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
 * 
 * 
 */ 
// Date: Tue Mar  2 15:36:49 PST 2021
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        var left = 0
        while left < nums.count {
            if nums[left] == sorted[left] { left += 1 }
            else { break }
        }
        var right = nums.count - 1
        while right > left {
            if nums[right] == sorted[right] { right -= 1 }
            else { break }
        }
        // print("\(left) - \(right)")
        return right - left + 1
    }
}

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var stack: [Int] = []
        var left = nums.count
        for index in 0 ..< nums.count {
            while let last = stack.last, nums[last] > nums[index] {
                stack.removeLast()
                left = min(left, last)
            }
            stack.append(index)
        }
        stack = []
        var right = 0
        for index in stride(from: nums.count - 1, through: 0, by: -1) {
            while let last = stack.last, nums[last] < nums[index] {
                stack.removeLast()
                right = max(right, last)
            }
            stack.append(index)
        }
        
        return right > left ? right - left + 1 : 0
    }
}