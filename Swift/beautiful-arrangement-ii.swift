/**
 * https://leetcode.com/problems/beautiful-arrangement-ii/
 * 
 * 
 */ 
// Date: Mon Apr 12 17:09:50 PDT 2021
class Solution {
    func constructArray(_ n: Int, _ k: Int) -> [Int] {
        var result = [Int]()
        var k = k
        var start = 1
        var end = n
        while start <= end {
            if k > 1 {
                if k % 2 == 0 {
                    result.append(end)
                    end -= 1
                } else {
                    result.append(start)
                    start += 1
                }
                k -= 1
            } else {
                result.append(start)
                start += 1
            }
        }
        return result
    }
}