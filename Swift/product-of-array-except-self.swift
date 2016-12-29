/**
 * https://leetcode.com/problems/product-of-array-except-self/
 * 
 * 
 */ 
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var prod = Array(repeating: 1, count: n)
        for i in 1..<n {
            prod[n-i-1] = prod[n-i] * nums[n-i]
        }
        var pLeft = 1
        for i in 0..<n {
            prod[i] *= pLeft
            pLeft *= nums[i]
        }
        return prod
    }
}
