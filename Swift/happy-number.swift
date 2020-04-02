/**
 * https://leetcode.com/problems/happy-number/
 * 
 * 
 */ 
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var list: Set<Int> = [n]
        while n > 1 {
            var sum = 0
            while n > 0 {
                sum += (n % 10) * (n % 10)
                n /= 10
            }
            if list.contains(sum) { return false }
            list.insert(sum)
            n = sum
        }
        return true
    }
}
