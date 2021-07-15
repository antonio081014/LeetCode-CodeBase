/**
 * https://leetcode.com/problems/valid-triangle-number/
 * 
 * 
 */ 
// Date: Thu Jul 15 11:32:45 PDT 2021
class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        var result = 0
        let nums = nums.sorted()
        let n = nums.count
        for start in 0 ..< (n - 2) {
            for end in stride(from: start + 2, to: n, by: 1) {
                let a = nums[start]
                let c = nums[end]
                if let left = binarySearchLowerBound(nums, start + 1, end - 1, c - a + 1) {
                    result += end - left
                }
            }
        }
        return result
    }
    
    private func binarySearchLowerBound(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int? {
        var left = start
        var right = end + 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        if left < start || nums[left] < target { return nil }
        return left
    }
    
    private func binarySearchUpperBound(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int? {
        var left = start
        var right = end + 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        if left < start || nums[left] <= target { return nil }
        return left
    }
}