/**
 * https://leetcode.com/problems/letter-case-permutation/
 * 
 * 
 */ 
// Date: Tue Feb 16 13:10:03 PST 2021
class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        var S = Array(S)
        var result: Set<String> = []
        func solve(_ index: Int) {
            result.insert(String(S))
            if index >= S.count { return }
            for start in index ..< S.count {
                if S[start].isLetter {
                    let char = S[start]
                    if S[start].isUppercase {
                        S[start] = Character(S[start].lowercased())
                    } else {
                        S[start] = Character(S[start].uppercased())
                    }
                    solve(start + 1)
                    S[start] = char
                }
            }
        }
        solve(0)
        // print(result.count)
        return Array(result)
    }
}