/**
 * In the Binary World,
 * 0 + 0 = 0
 * 1 + 0 = 1
 * 1 + 1 = 10
 * 
 * 0 & 0 = 0
 * 1 & 0 = 0
 * 1 & 1 = 1
 * 
 * 0 ^ 0 = 0
 * 1 ^ 0 = 1
 * 1 ^ 1 = 0
 *
 */

class Solution {
    // Non-Recursive solution.
    func getSum(a: Int, _ b: Int) -> Int {
        var _a = a
        var _b = b
        while _b != 0 {
            let c = _a ^ _b
            let d = (_a & _b) << 1
            _a = c
            _b = d
        }
        return _a
    }
    
    // Recursive solution.
    func getSum(a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        } else {
            let c = a ^ b
            let d = (a & b) << 1
            return getSum(c, d)
        }
    }
}
