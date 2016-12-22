/**
 * https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
 * 
 * 
 */ 
class Solution {
    // Very smart + tricky.
    // Try to add n to each number has been appeared, which will left out the ones hasn't been appeared.
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var num = nums
        var ret = [Int]()
        for i in 0..<num.count {
            num[(num[i]-1)%n] += n
        }
        for i in 0..<num.count {
            if num[i] <= n {
                ret += [i+1]
            }
        }
        return ret
    }
}
