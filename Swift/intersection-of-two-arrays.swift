/**
 * https://leetcode.com/problems/intersection-of-two-arrays/
 * 
 * 
 */ 
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ret: Set<Int> = []
        let nums2 = nums2.sorted()
        for n in nums1 {
            var left = 0
            var right = nums2.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums2[mid] == n {
                    ret.insert(n)
                    break
                } else if nums2[mid] > n {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return Array(ret)
    }
}
