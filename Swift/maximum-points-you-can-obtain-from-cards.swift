/**
 * https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/
 * 
 * 
 */ 
// Date: Tue May 11 13:15:23 PDT 2021
class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var sum = [0]
        for p in cardPoints {
            sum.append((sum.last ?? 0) + p)
        }
        // print(sum)
        var maxScore = max(sum[k], sum[cardPoints.count] - sum[cardPoints.count - k])
        for index in 1 ..< k {
            maxScore = max(maxScore, sum[index] + sum[cardPoints.count] - sum[cardPoints.count - k + index])
        }
        return maxScore
    }
}