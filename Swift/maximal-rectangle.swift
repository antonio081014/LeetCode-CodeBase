/**
 * Problem Link: https://leetcode.com/problems/maximal-rectangle/
 *
 * Using the idea of largest rectangle of histgram.
 *
 */

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let n = matrix.count
        if n == 0 {
            return 0
        }
        let m = matrix[0].count
        var height = [[Int]]()
        for i in 0..<n {
            var list = [Int]()
            for j in 0..<m {
                if matrix[i][j] == "0" {
                    list += [0]
                } else {
                    list += [1 + (i == 0 ? 0 : height[i-1][j])]
                }
            }
            height += [list]
        }
        var maxa = 0
        
        for i in 0..<n {
            maxa = max(maxa, largestRectangleArea(height[i]))
        }
        return maxa
    }
    
    private func largestRectangleArea(_ heightsList: [Int]) -> Int {
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
 * https://leetcode.com/problems/maximal-rectangle/
 * 
 * 
 */ 
// Date: Thu Jul  2 11:11:24 PDT 2020
class Solution {
    /// Ref: https://www.youtube.com/watch?v=2Yk3Avrzauk
    /// - Complexity:
    ///     - Time: O(n*m*m), 
    ///     - Space: O(m)
    ///
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let n = matrix.count
        guard let m = matrix.first?.count else { return 0 }
        var maxArea = 0
        var heights = Array(repeating: 0, count: m)
        for x in 0 ..< n {
            for y in 0 ..< m {
                if let num = Int(String(matrix[x][y])), num > 0 {
                    heights[y] += num
                } else {
                    heights[y] = 0
                }
            }
            maxArea = max(maxArea, largestRectangleArea(heights))
        }
        
        return maxArea
    }
    
    /// - Complexity:
    ///     - Time: O(m), m is the number of elements in heights.
    ///     - Space: O(m), m is the number of elements in heights.
    ///
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
