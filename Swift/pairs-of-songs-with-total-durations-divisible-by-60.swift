/**
 * https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
 * 
 * 
 */ 
// Date: Tue Dec  8 10:29:04 PST 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(nlogn), n = time.count
    ///     - Space: O(n), n = time.count
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        let time = time.map { $0 % 60 == 0 ? 60 : $0 % 60 }.sorted()
        var result = 0
        for index in 0 ..< time.count {
            var left = index + 1
            var right = time.count
            while left < right {
                let mid = left + (right - left) / 2
                if time[index] + time[mid] >= 60 {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            while left < time.count, (time[index] + time[left]) % 60 == 0 {
                result += 1
                left += 1
            }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
 * 
 * 
 */ 
// Date: Tue Dec  8 10:37:46 PST 2020
class Solution {
    /// Scan through the array.
    /// - Complexity:
    ///     - Time: O(n), n = time.count
    ///     - Space: O(n), n = time.count
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var counter = Array(repeating: 0, count: 60)
        var result = 0
        for t in time {
            if t % 60 == 0 {
                result += counter[0]
            } else {
                result += counter[60 - t % 60]
            }
            counter[t % 60] += 1
        }
        return result
    }
}