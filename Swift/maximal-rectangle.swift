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
