/**
 * https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays/
 * 
 * 
 */ 
// Date: Wed May 20 17:29:25 PDT 2020
class Solution {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        var windowSum: [Int] = []
        var sum = 0
        for index in 0 ..< nums.count {
            sum += nums[index]
            if index >= k {
                sum -= nums[index - k]
            }
            if index >= k - 1 {
                windowSum.append(sum)
            }
        }
        
        var leftMaxSumIndices: [Int] = Array(repeating: 0, count: windowSum.count)
        var leftMaxIndex = 0
        for index in 0 ..< windowSum.count {
            if windowSum[index] > windowSum[leftMaxIndex] {
                leftMaxIndex = index
            }
            leftMaxSumIndices[index] = leftMaxIndex
        }
        
        var rightMaxSumIndices: [Int] = Array(repeating: 0, count: windowSum.count)
        var rightMaxIndex = windowSum.count - 1
        for index in stride(from: windowSum.count - 1, to: 0, by: -1) {
            ///lexicographically order is required, so we need to get the smallest index when sums are equal
            if windowSum[index] >= windowSum[rightMaxIndex] {
                rightMaxIndex = index
            }
            rightMaxSumIndices[index] = rightMaxIndex
        }
        
        var ret = [-1, -1, -1]
        for index in k ..< (windowSum.count - k) {
            let left = leftMaxSumIndices[index - k]
            let right = rightMaxSumIndices[index + k]
            if ret[0] == -1 || windowSum[left] + windowSum[index] + windowSum[right] > windowSum[ret[0]] + windowSum[ret[1]] + windowSum[ret[2]] {
                ret = [left, index , right]
            }
        }
        return ret
    }
}
