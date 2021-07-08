/**
 * https://leetcode.com/problems/maximum-length-of-repeated-subarray/
 * 
 * 
 */ 
// Date: Thu Jul  8 13:42:30 PDT 2021
class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count
        var result = 0
        var cost = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for x in 0 ..< n {
            for y in 0 ..< m {
                if nums1[x] == nums2[y] {
                    cost[x + 1][y + 1] = cost[x][y] + 1
                }
                result = max(result, cost[x + 1][y + 1])
            }
        }

        return result
    }
}

