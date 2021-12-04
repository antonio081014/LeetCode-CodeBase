/**
 * https://leetcode.com/problems/maximum-product-subarray/
 * 
 * 
 */ 
// Date: Sun Sep 20 12:03:17 PDT 2020
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var prevMax = nums[0]
        var prevMin = nums[0]
        var result = Int.min
        for index in stride(from: 1, to: nums.count, by: 1) {
            prevMax = max(nums[index], nums[index] * max(prevMax, prevMin))
            prevMin = min(nums[index], nums[index] * min(prevMax, prevMin))
            result = max(result, prevMax)
        }
        return result
    }
}/**
 * https://leetcode.com/problems/maximum-product-subarray/
 * 
 * 
 */ 
// Date: Sun Sep 20 12:03:55 PDT 2020
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var prevMax = nums[0]
        var prevMin = nums[0]
        var result = prevMax
        for index in stride(from: 1, to: nums.count, by: 1) {
            if (nums[index] < 0) {
                let tmp = prevMax
                prevMax = prevMin
                prevMin = tmp
            }
            prevMax = max(prevMax * nums[index], nums[index])
            prevMin = min(prevMin * nums[index], nums[index])
            // print("\(nums[index]) - \(prevMax) : \(prevMin)")
            result = max(result, prevMax)
        }
        return result
    }
}/**
 * https://leetcode.com/problems/maximum-product-subarray/
 * 
 * 
 */ 
// Date: Sat Dec  4 00:38:01 PST 2021
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var cmax = 1
        var cmin = 1
        var result = Int.min
        for n in nums {
            let list = [cmax * n, n, cmin * n].sorted()
            cmax = list[2]
            cmin = list[0]
            result = max(result, cmax)
        }
        return result
    }
}