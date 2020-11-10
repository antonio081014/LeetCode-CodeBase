/**
 * https://leetcode.com/problems/flipping-an-image/
 * 
 * 
 */ 
// Date: Tue Nov 10 09:03:11 PST 2020
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        let n = A.count
        guard let m = A.first?.count else { return [] }
        var B = A
        for x in 0 ..< n {
            var start = 0
            var end = m - 1
            while start <= end {
                let tmp = 1 - B[x][start]
                B[x][start] = 1 - B[x][end]
                B[x][end] = tmp
                start += 1
                end -= 1
            }
        }
        return B
    }
}