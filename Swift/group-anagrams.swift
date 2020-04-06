/**
 * https://leetcode.com/problems/group-anagrams/
 * 
 * 
 */ 
class Solution {
    /// - Complexity:
    ///     - Time: O(NKlogK), N is the number of elements in the array, K is the length of given single text.
    ///     - Space: O(NK), the total info stored in dict.
    ///
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let key = getKey(for: str)
            dict[key] = dict[key, default: [String]()] + [str]
        }
        var ret: [[String]] = []
        for value in dict.values {
            ret.append(value)
        }
        return ret
    }
    /// - Complexity:
    ///     - Time: O(KlogK), K is the length of text. Worst case: O(K^2)
    ///     - Space: O(logK), K is the length of text. Worst case: O(K)
    ///
    fileprivate func getKey(for text: String) -> String {
        return String(text.sorted())
    }
}
