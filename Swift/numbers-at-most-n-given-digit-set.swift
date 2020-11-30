/**
 * https://leetcode.com/problems/numbers-at-most-n-given-digit-set/
 * 
 * 
 */ 
// Date: Sun Nov 29 17:01:09 PST 2020
class Solution {
    /// BFS
    /// TLE.
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        let digits = digits.map { Int($0)! }
        var queue = digits.filter { $0 <= n }
        var result: Set<Int> = Set(queue)

        while queue.isEmpty == false {
            let num = queue.removeFirst()
            for x in digits {
                if num * 10 + x <= n, result.contains(num * 10 + x) == false {
                    result.insert(num * 10 + x)
                    queue.append(num * 10 + x)
                }
            }
        }

        return result.count
    }
}

/**
 * https://leetcode.com/problems/numbers-at-most-n-given-digit-set/
 * 
 * 
 */ 
// Date: Sun Nov 29 17:17:26 PST 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(log10(n))
    ///     - Space: O(1)
    ////
    /// Reference: [Tech blog of HuaHua](https://zxi.mytechroad.com/blog/math/leetcode-902-numbers-at-most-n-given-digit-set/)
    ///
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        let n = Array(String(n)).map { String($0) }
        var result = 0
        for index in 1 ..< n.count {
            result += Int(pow(Double(digits.count), Double(index)))
        }

        for index in 0 ..< n.count {
            var exists = false
            for d in digits {
                if d < n[index] {
                    result += Int(pow(Double(digits.count), Double(n.count - 1 - index)))
                } else if d == n[index] {
                    exists = true
                    break
                }
            }
            if exists == false { return result }
        }
        return result + 1
    }
}

