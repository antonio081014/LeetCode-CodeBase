/**
 * https://leetcode.com/problems/counting-bits/
 * 
 * 
 */ 
// f(2n) = f(n)
// f(2n+1) = f(n) + 1
class Solution {
    func countBits(_ num: Int) -> [Int] {
        var count = [Int]()
        count += [0]
        guard num > 0 else { return count }
        for n in 1...num {
            count += [count[n/2] + (n%2)]
        }
        return count
    }
}
