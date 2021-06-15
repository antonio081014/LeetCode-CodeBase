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
/**
 * https://leetcode.com/problems/matchsticks-to-square/
 * 
 * 
 */ 
// Date: Tue Jun 15 16:22:11 PDT 2021
class Solution {
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let matchsticks = matchsticks.sorted { $0 > $1 }
        let sum = matchsticks.reduce(0) { $0 + $1 }
        if sum % 4 != 0 { return false }
        let sizeLength = sum / 4
        let n = matchsticks.count
        var sides = Array(repeating: 0, count: 4)

        func dfs(_ index: Int) -> Bool {
            if index >= n {
                return Set(sides).count == 1
            }

            for sideIndex in 0 ..< 4 {
                if sides[sideIndex] + matchsticks[index] <= sizeLength {
                    sides[sideIndex] += matchsticks[index]
                    if dfs(index + 1) { return true }
                    sides[sideIndex] -= matchsticks[index]
                }
            }
            return false
        }

        return dfs(0)
    }
}

