/**
 * https://leetcode.com/problems/shortest-distance-to-a-character/
 * 
 * 
 */ 
// Date: Sun Feb  7 08:57:06 PST 2021
class Solution {
    /// Complexity:
    ///     - Time: O(nlogn) where n == s.count
    ///     - Space: O(n) where n == s.count, we have occurrence to keep all the index of target character c.
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        var result: [Int] = []
        let occurrence: [Int] = s.enumerated().filter { $0.1 == c }.map { $0.0 }
        for (index, cc) in s.enumerated() {
            var left = 0
            var right = occurrence.count
            while left < right {
                let mid = left + (right - left) / 2
                if occurrence[mid] >= index {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            if left == occurrence.count { left -= 1 }
            var dist = abs(occurrence[left] - index)
            if left > 0 {
                dist = min(dist, abs(occurrence[left - 1] - index))
            }
            result.append(dist)
        }
        // print(result)
        return result
    }
}/**
 * https://leetcode.com/problems/shortest-distance-to-a-character/
 * 
 * 
 */ 
// Date: Sun Feb  7 09:08:27 PST 2021
class Solution {
    /// - Complexity:
    ///     - Time: O(n) where n == s.count
    ///     - Space: O(n) where n == s.count, we use s to keep the array of each character in string s.
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let s = Array(s)
        var result: [Int] = []
        var last = -s.count * 3
        for index in 0 ..< s.count {
            if s[index] == c { last = index }
            result.append(index - last)
        }
        
        last = s.count * 3
        for index in stride(from: result.count - 1, through: 0, by: -1) {
            if s[index] == c { last = index }
            result[index] = min(result[index], last - index)
        }
        return result
    }
}