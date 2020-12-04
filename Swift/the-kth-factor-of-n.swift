/**
 * https://leetcode.com/problems/the-kth-factor-of-n/
 * 
 * 
 */ 
// Date: Fri Dec  4 09:56:11 PST 2020
class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var count = 0
        for num in 1 ... n {
            if n % num == 0 {
                count += 1
                if count == k { return num }
            }
        }
        return -1
    }
}