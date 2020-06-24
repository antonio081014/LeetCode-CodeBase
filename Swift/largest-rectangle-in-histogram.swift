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
/**
 * https://leetcode.com/problems/largest-rectangle-in-histogram/
 * 
 * 
 */ 
// Date: Wed Jun 24 12:04:45 PDT 2020
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        var leftBound = Array(repeating: -1, count: heights.count)
        for index in 1 ..< heights.count {
            var p = index - 1
            while p >= 0, heights[p] >= heights[index] {
                p = leftBound[p]
            }
            leftBound[index] = p
        }
        var rightBound = Array(repeating: heights.count, count: heights.count)
        for index in stride(from: heights.count - 2, through: 0, by: -1) {
            var p = index + 1
            while p < heights.count, heights[p] >= heights[index] {
                p = rightBound[p]
            }
            rightBound[index] = p
        }

        var maxArea = 0
        for index in 0 ..< heights.count {
            maxArea = max(maxArea, heights[index] * (rightBound[index] - leftBound[index] - 1))
        }
        return maxArea
    }
}

