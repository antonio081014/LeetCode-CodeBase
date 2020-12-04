/**
 * https://leetcode.com/problems/the-kth-factor-of-n/
 * 
 * 
 */ 
// Date: Fri Dec  4 09:56:11 PST 2020
class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var count = 0
        for num in 1 ... n {
            if n % num == 0 {
                count += 1
                if count == k { return num }
            }
        }
        return -1
    }
}/**
 * https://leetcode.com/problems/the-kth-factor-of-n/
 * 
 * 
 */ 
// Date: Fri Dec  4 10:18:52 PST 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(sqrt(n))
    ///     - Space: O(sqrt(n))
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var count = 0
        var list: [Int] = []
        var d = 1
        while d * d <= n {
            if n % d == 0 {
                count += 1
                if d * d != n { list.append(n / d) }
                if count == k { return d }
            }
            d += 1
        }
        return list.count + count < k ? -1 : list[list.count - k + count]
    }
}