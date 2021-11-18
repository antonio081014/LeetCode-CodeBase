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
/**
 * https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
 * 
 * 
 */ 
// Date: Wed Nov 17 21:16:54 PST 2021
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var set = Set<Int>(1 ... n)
        for n in nums {
            if set.contains(n) { 
                set.remove(n)
            }
        }
        return Array(set)
    }
}