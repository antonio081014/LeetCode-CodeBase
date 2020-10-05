/**
 * https://leetcode.com/problems/complement-of-base-10-integer/
 * 
 * 
 */ 
// Date: Mon May  4 09:00:03 PDT 2020
class Solution {
    func bitwiseComplement(_ num: Int) -> Int {
        if num == 0 { return 1 }
        var ret = 0
        var num = num
        var bit = 0
        while num > 0 {
            if num % 2 == 0 {
                ret += (1 << bit)
            }
            num /= 2
            bit += 1
        }
        return ret
    }
}
/**
 * https://leetcode.com/problems/complement-of-base-10-integer/
 * 
 * 
 */ 
// Date: Mon Oct  5 08:23:03 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(32)
    ///     - Space: O(32)
    func bitwiseComplement(_ N: Int) -> Int {
        if N == 0 { return 1 }
        var result = [Int]()
        var n = N
        while n > 0 {
            result.insert(1 - n % 2, at: 0)
            n /= 2
        }
        while let first = result.first, first == 0 {
            result.removeFirst()
        }
        return result.reduce(0) { $0 * 2 + $1 }
    }
}