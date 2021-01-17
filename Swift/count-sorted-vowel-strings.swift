/**
 * https://leetcode.com/problems/count-sorted-vowel-strings/
 * 
 * 
 */ 
// Date: Sun Jan 17 09:11:20 PST 2021
class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var a = 1, e = 1, i = 1, o = 1, u = 1
        for j in 1..<n{
            a = (a+e+i+o+u)
            e = (e+i+o+u)
            i = (i+o+u)
            o = (o+u)
        }
        return (a+e+i+o+u)
    }
}