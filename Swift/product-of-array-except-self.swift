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
/**
 * https://leetcode.com/problems/product-of-array-except-self/
 * 
 * 
 */ 
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 1, count: nums.count)
        
        var prod = 1
        for index in 0 ..< nums.count {
            result[index] *= prod
            prod *= nums[index]
        }
        prod = 1
        for index in (0 ..< nums.count).reversed() {
            result[index] *= prod
            prod *= nums[index]
        }
        return result
    }
    
    func productExceptSelf2(_ nums: [Int]) -> [Int] {
        var leftp = [1]
        var rightp = [1]
        for index in 1 ..< nums.count {
            let left = leftp.last ?? 1
            leftp.append(left * nums[index - 1])
            let right = rightp.first ?? 1
            rightp.insert(right * nums[nums.count - index], at: 0)
        }
        
        var result: [Int] = []
        for index in 0 ..< nums.count {
            result.append(leftp[index] * rightp[index])
        }
        return result
    }
}
