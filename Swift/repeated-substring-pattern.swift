/**
 * https://leetcode.com/problems/repeated-substring-pattern/
 * 
 * 
 */ 
// Date: Tue Sep  8 09:45:05 PDT 2020
/// Reference:
/// https://leetcode.com/discuss/explore/september-leetcoding-challenge/826207/repeated-substring-pattern-oneline-solution-explained
/**
If there is a repition in s, it means s can be seen as a combination of (at least) two string t.
s = t + t

If we double s, we get "t + t + t + t = 4t". cutting away the first and last letter, we end with " u + t + t + u = u + s + u" with u being whatever is left (could be empty).
But because s is at least 2t, 2s is 4t and taking away the first and last letter only "destroys" 2t, so the string still contains s.
*/
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        var text = s + s
        text.removeFirst()
        text.removeLast()
        return text.contains(s)
    }
}