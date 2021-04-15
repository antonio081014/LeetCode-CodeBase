/**
 * https://leetcode.com/problems/fibonacci-number/
 * 
 * 
 */ 
// Date: Thu Apr 15 11:44:25 PDT 2021
class Solution {
    
    var fibNumber: [Int : Int] = [:]
    
    func fib(_ n: Int) -> Int {
        if let val = fibNumber[n] { return val }
        if n < 2 {
            fibNumber[n] = n
            return n
        }
        fibNumber[n] = fib(n - 1) + fib(n - 2)
        return fibNumber[n]!
    }
}