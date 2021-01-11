/**
 * https://leetcode.com/problems/create-sorted-array-through-instructions/
 * 
 * 
 */ 
// Date: Sun Jan 10 23:07:32 PST 2021
class Solution {
    /// - Complexity: TLE
    ///     - Time: O(nlogn)
    
    private var sortedArray: [Int] = []
    
    func createSortedArray(_ instructions: [Int]) -> Int {
        var cost = 0
        for x in instructions {
            let left = searchFirst(sortedArray, x)
            let right = searchLast(sortedArray, x)
            // print("\(x) : \(left) - \(right)")
            cost += min(left, sortedArray.count - right)
            cost %= 1000000007
            sortedArray.insert(x, at: left)
        }
        return cost
    }
    
    func searchFirst(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        while left < right {
            let mid = (left + right) / 2
            // Try to find the very first element >= target.
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func searchLast(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        while left < right {
            let mid = (left + right) / 2
            // Try to find the very first element > target
            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}