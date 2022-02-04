class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        var minSum = 0
        var minDiff = Int.max
        
        for start in 0 ..< nums.count {
            let sum = target - nums[start]
            
            var left = start + 1
            var right = nums.count - 1
            while left < right {
                let tmpSum = nums[left] + nums[right]
                if minDiff > abs(sum - tmpSum) {
                    minDiff = abs(sum - tmpSum)
                    minSum = nums[start] + nums[left] + nums[right]
                }
                if tmpSum > sum {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return minSum
        
    }
}
