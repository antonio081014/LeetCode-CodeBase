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

