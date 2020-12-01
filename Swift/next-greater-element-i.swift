/**
 * https://leetcode.com/problems/next-greater-element-i/
 * 
 * 
 */ 
// Date: Tue Dec  1 11:13:44 PST 2020
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map: [Int : Int] = [:]
        var stack: [Int] = []
        for n in nums2 {
            while let last = stack.last, last < n {
                map[last] = n
                stack.removeLast()
            }
            stack.append(n)
        }
        return nums1.map { map[$0, default: -1] }
    }
}