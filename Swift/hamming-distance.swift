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
}
