/**
 * https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
 * 
 * 
 */ 
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        while left < right {
            // print("\(left) - \(right)")
            if target == numbers[left] + numbers[right] {return [left+1, right+1]}
            else if target < numbers[left] + numbers[right] {right -= 1}
            else {left += 1}
        }
        return [0, 0]
    }
}
