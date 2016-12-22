/**
 * https://leetcode.com/problems/matchsticks-to-square/
 * 
 * 
 */ 
class Solution {
    func makesquare(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        }
        var sumL = 0
        
        for l in nums {
            sumL += l
        }
        
        if sumL%4 != 0 {
            return false
        }
        
        sumL /= 4
        // Using bigger number first will help us terminate dfs eailer if current sums solution could not satisfy the requirement.
        return dfs(nums.sorted(by: >), Array(repeating: 0, count: 4), 0, sumL)
    }
    
    private func dfs(_ nums: [Int], _ sums: [Int], _ index: Int, _ target: Int) -> Bool {
        if index == nums.count {
            guard sums[0]==target, sums[1]==target, sums[2]==target, sums[3]==target else {
                return false
            }
            return true
        }
        for i in 0..<4 {
            if sums[i] + nums[index] <= target {
                var ss = sums
                ss[i] += nums[index]
                if dfs(nums, ss, index+1, target) {
                    return true
                }
            }
        }
        return false
    }
}
print("\(makesquare([1,1,2,2,2]))")
print("\(makesquare([5969561,8742425,2513572,3352059,9084275,2194427,1017540,2324577,6810719,8936380,7868365,2755770,9954463,9912280,4713511]))")
