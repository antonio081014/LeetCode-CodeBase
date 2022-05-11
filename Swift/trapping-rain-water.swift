/**
 * Problem Link: https://leetcode.com/problems/trapping-rain-water/
 *
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        if n == 0 {
            return 0
        }
        var maxLeft = [Int]()
        var maxRight = [Int]()
        maxLeft.append(0)
        maxRight.append(0)
        for i in 1..<n {
            maxLeft.append(max(height[i-1], maxLeft.last!))
            maxRight.insert(max(height[n-i], maxRight.first!), at: 0)
        }
        
        var total = 0
        for i in 0..<n {
            total += max(0, min(maxLeft[i], maxRight[i]) - height[i])
        }
        return total
    }
}

class Solution {
    func trap(_ height: [Int]) -> Int {
        var result = 0
        var stack = [Int]()
        for index in 0 ..< height.count {
            while let top = stack.last, height[index] > height[top] {
                stack.removeLast()
                if let last = stack.last {
                    let dist = index - last - 1
                    let bounded_height = min(height[index], height[last]) - height[top]
                    result += dist * bounded_height
                }
            }
            stack.append(index)
        }
        return result
    }
}
