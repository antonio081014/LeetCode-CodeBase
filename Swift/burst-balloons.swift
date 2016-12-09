/**
 * Problem Link: https://leetcode.com/problems/burst-balloons/
 * 
 * mark[i][j] represents the max score we could get from balloon i to balloon j, inclusive.
 *
 */

class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        let balloons = [1] + nums + [1]
        var mark = [[Int]]()
        for i in 0..<balloons.count {
            var tmp = [Int]()
            for i in 0..<balloons.count {
                tmp.append(0)
            }
            mark.append(tmp)
        }
        for len in 1...n {
            for left in 1...(n + 1 - len) {
                let right = left + len - 1
                for k in left...right {
                    mark[left][right] = max(mark[left][right], mark[left][k-1] + mark[k+1][right] + balloons[k] * balloons[left - 1] * balloons[right + 1])
                }
            }
        }
        return mark[1][n]
    }
}
