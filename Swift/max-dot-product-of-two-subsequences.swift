/**
 * https://leetcode.com/problems/max-dot-product-of-two-subsequences/
 * 
 * 
 */ 
// Date: Thu May 28 17:04:15 PDT 2020
class Solution {
    ///
    /// mark[x][y] indicates the maximum dot product ending at x of nums1, and y of nums2.
    /// To be, or not to be.
    /// Options at (x, y)
    /// 1. Just use the product of numbers at x and y.
    /// 2. Use product of numbers at x and y, plus the max dot product ending with x - 1, and y - 1.
    /// 3. Not use product of numbers at x and y, if answer at x - 1 and y is greater.
    /// 4. Not use product of numbers at x and y, if answer at x and y - 1 is greater.
    ///
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count
        var mark = Array(repeating: Array(repeating: Int.min, count: m + 1), count: n + 1)
        for x in 1 ... n {
            for y in 1 ... m {
                mark[x][y] = nums1[x - 1] * nums2[y - 1]
                mark[x][y] += max(0, mark[x - 1][y - 1])
                mark[x][y] = max(mark[x - 1][y], mark[x][y])
                mark[x][y] = max(mark[x][y], mark[x][y - 1])
            }
        }
        // print("\(mark)")
        return mark[n][m]
    }
}
