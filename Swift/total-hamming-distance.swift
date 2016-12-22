/**
 * https://leetcode.com/problems/total-hamming-distance/
 * 
 * 
 */ 
class Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        let n = nums.count
        var total = 0
        for bit in 0..<32 {
            var ones = 0
            for i in 0..<n {
                ones += ((nums[i] >> bit) & 1)
            }
            total += ones * (n - ones)
        }
        return total
    }
}
