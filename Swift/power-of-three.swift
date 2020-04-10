/**
 * https://leetcode.com/problems/power-of-three/
 * 
 * 
 */ 
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var n = n
        while n > 1 {
            if n % 3 != 0 { return false }
            n /= 3
        }
        return n == 1
    }
}

/// 3 ^ (⌊log3MaxInt⌋) = 3 ^ ⌊19.56⌋ =3^19 =1162261467
/// This is a very mathematica way.
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && 1162261467 % n == 0
    }
}
