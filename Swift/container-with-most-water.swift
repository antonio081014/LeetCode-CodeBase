/**
 * Problem Link: https://leetcode.com/problems/container-with-most-water/
 *
 *
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var water = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            let h = min(height[left], height[right])
            let w = h * (right - left)
            water = max(water, w)
            while height[left] <= h, left < right {
                left += 1
            }
            while height[right] <= h, left < right {
                right -= 1
            }
        }
        return water
    }
}
