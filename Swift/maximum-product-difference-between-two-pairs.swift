class Solution {
    /// - Complexity:
    ///     - Time: O(n), n = nums.count
    ///     - Space: O(1)
    func maxProductDifference(_ nums: [Int]) -> Int {
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        
        for n in nums {
            if n < min1 {
                min2 = min1
                min1 = n
            } else if n < min2 {
                min2 = n
            }
            
            if n > max1 {
                max2 = max1
                max1 = n
            } else if n > max2 {
                max2 = n
            }
        }
        // print(min1, min2, max1, max2)
        
        return max2 * max1 - min2 * min1
    }
    
    /// - Complexity:
    ///     - Time: O(nlogn), n = nums.count
    ///     - Space: O(n)    
    func maxProductDifference2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        return nums[n - 1] * nums[n - 2] - nums[1] * nums[0]
    }
}
