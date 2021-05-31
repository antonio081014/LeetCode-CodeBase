/**
 * https://leetcode.com/problems/maximum-gap/
 * 
 * 
 */ 
// Date: Sun May 30 22:46:28 PDT 2021
class Solution {
    /// Radix Sort.
    func maximumGap(_ nums: [Int]) -> Int {
        var sortedNum = nums
        var div = 1
        let maxValue = nums.max()!
        while maxValue / div > 0 {
            var freq = Array(repeating: 0, count: 10)

            for n in sortedNum {
                freq[(n / div) % 10] += 1
            }
            for index in 1 ..< 10 {
                freq[index] += freq[index - 1]
            }

            let reversed = sortedNum.reversed()
            for n in reversed {
                let digit = (n / div) % 10
                freq[digit] -= 1
                sortedNum[freq[digit]] = n
            }
            div *= 10
        }

        var result = 0
        for index in 1 ..< sortedNum.count {
            result = max(result, sortedNum[index] - sortedNum[index - 1])
        }
        return result
    }
}