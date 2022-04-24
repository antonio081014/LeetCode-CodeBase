/**
 * https://leetcode.com/problems/nth-magical-number/
 * 
 * 
 */ 
// Date: Sun Apr 24 12:39:53 PDT 2022
class Solution {
    func nthMagicalNumber(_ n: Int, _ a: Int, _ b: Int) -> Int {
        let MOD = 1_000_000_007
        let L = a / gcd(a, b) * b
        
        var lo = 0
        var hi = n * min(a, b)
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if (mid / a + mid / b - mid / L) < n {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo % MOD
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        if a == 0 { return b }
        return gcd(b % a, a)
    }
}