/**
 * https://leetcode.com/problems/next-greater-element-iii/
 * 
 * 
 */ 
// Date: Wed Dec 23 19:27:56 PST 2020
class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        var result = Array(String(n)).map { Int(String($0))! }
        nextPermutation(&result)
        let x = result.reduce(0) { $0 * 10 + $1 }
        return x > n && (x < (2147483647)) ? x : -1
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2
        while i >= 0 {
            if nums[i] < nums[i + 1] { break }
            i -= 1
        }
        if i < 0 {
            // Last permutation.
            nums.sort()
            return
        }
        
        var j = nums.count - 1
        while j > i {
            if nums[j] > nums[i] { break }
            j -= 1
        }
        nums.swapAt(i, j)
        i += 1
        j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}