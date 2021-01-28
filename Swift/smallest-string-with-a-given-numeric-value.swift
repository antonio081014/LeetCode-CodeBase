/**
 * https://leetcode.com/problems/smallest-string-with-a-given-numeric-value/
 * 
 * 
 */ 
// Date: Thu Jan 28 11:09:41 PST 2021
class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var list = Array(repeating: 0, count: n)
        var k = k - n
        var n = n
        while n > 0 {
            list[n - 1] = min(25, k)
            k -= min(25, k)
            n -= 1
        }
        var result: String = ""
        for x in list {
            result.append(Character(UnicodeScalar(x + 97)!))
        }
        return result
    }
}