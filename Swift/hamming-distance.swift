/**
 * https://leetcode.com/problems/hamming-distance/
 * 
 * 
 */ 
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var count = 0
        while z > 0 {
            if z & 1 > 0 {
                count += 1
            }
            z >>= 1
        }
        return count
    }
    
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        let z = x ^ y
        var count = 0
        for i in 0..<32 {
            if ((z>>i) & 1) > 0 {
                count += 1
            }
        }
        return count
    }
}
/**
 * https://leetcode.com/problems/hamming-distance/
 * 
 * 
 */ 
// Date: Fri May  8 13:53:34 PDT 2020
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var n = x ^ y
        var count = 0
        while n > 0 {
            count += 1
            n &= (n - 1)
        }
        return count
    }
}
