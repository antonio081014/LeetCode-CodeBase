/**
 * https://leetcode.com/problems/super-pow/
 * 
 * 
 */ 
class Solution {
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        if b.isEmpty { return 1 }
        var b = b
        let last = b.removeLast()
        return powerWithMode(a, last) * powerWithMode(superPow(a, b), 10) % 1337
    }
    
    fileprivate func powerWithMode(_ a: Int, _ b: Int, _ mod: Int = 1337) -> Int {
        if b == 0 { return 1 }
        if b == 1 { return a % mod }
        if b % 2 == 0 {
            let p = powerWithMode(a, b / 2, mod)
            return (p * p) % mod
        } else {
            let p = powerWithMode(a, b / 2, mod)
            return ((p * p) % mod * a) % mod
        }
    }
}
