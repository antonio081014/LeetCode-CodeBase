/**
 * Problem Link: https://leetcode.com/problems/largest-rectangle-in-histogram/
 *
 * The stack keep the index of incremental heights. 
 */

class Solution {
    func largestRectangleArea(_ heightsList: [Int]) -> Int {
        var heights = heightsList + [0]
        var list = [Int]()
        var maxA = 0
        var index = 0
        while index < heights.count {
            if list.count == 0 || heights[list.last!] <= heights[index] {
                list.append(index)
                index += 1
            } else {
                let h = heights[list.popLast()!]
                let w = list.isEmpty ? index : index - list.last! - 1
                maxA = max(maxA, w * h)
            }
        }
        return maxA
    }
}
