/**
 * https://leetcode.com/problems/minimum-operations-to-make-array-equal/
 * 
 * 
 */ 
// Date: Tue Apr  6 09:26:36 PDT 2021
class Solution {
    func minOperations(_ n: Int) -> Int {
        var result = 0
        for x in stride(from: 1, to: n, by: 2) {
            result += n - x
        }
        return result
    }
}/**
 * https://leetcode.com/problems/minimum-operations-to-make-array-equal/
 * 
 * 
 */ 
// Date: Tue Apr  6 09:48:08 PDT 2021
class Solution {    
    func minOperations(_ n: Int) -> Int {
        return n % 2 == 1 ? n / 2 * ( n / 2 + 1 ) : n / 2 * n / 2 
    }
}