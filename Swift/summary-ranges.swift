/**
 * https://leetcode.com/problems/summary-ranges/
 * 
 * 
 */ 
// Date: Wed Oct 28 10:08:38 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(n), n is the nums.count
    ///     - Space: O(1), using stack to store the start and end number. In stack, it actually stores 1 or 2 numbers.
    func summaryRanges(_ nums: [Int]) -> [String] {        
        var stack = [Int]()
        var result = [String]()
        func takecare(of stack: inout [Int]) {
            var text = "\(stack.removeFirst())"
            if stack.isEmpty == false {
                text.append("->\(stack.removeLast())")
            } 
            result.append(text)
        }
        for n in nums {
            if let last = stack.last {
                if n - last == 1 {
                    if stack.count > 1 {
                        stack.removeLast()
                    }
                } else {
                    takecare(of: &stack)
                }
            }
            stack.append(n)
        }
        if stack.isEmpty == false {
            takecare(of: &stack)
        }
        return result
    }
}/**
 * https://leetcode.com/problems/summary-ranges/
 * 
 * 
 */ 
// Date: Wed Oct 28 10:10:09 PDT 2020
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 0 else { return [] }
        var result = [String]()
        var startIndex = 0
        for index in 0 ..< nums.count {
            if index == nums.count - 1 || nums[index] + 1 < nums[index + 1] {
                if startIndex == index {
                    result.append("\(nums[startIndex])")
                } else {
                    result.append("\(nums[startIndex])->\(nums[index])")
                }
                startIndex = index + 1
            }
        }
        return result
    }
}