class Solution {
    /// - Complexity:
    ///     - Time: O(n), n = s.count where s.count == t.count
    ///     - Space: O(k), k = count of possible ascii code in s and t.
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map1: [Character : Character] = [:]
        var map2: [Character : Character] = [:]
        let s = Array(s)
        let t = Array(t)
        if s.count != t.count { return false }
        for index in 0 ..< s.count {
            if map1[s[index]] == nil, map2[t[index]] == nil {
                map1[s[index]] = t[index]
                map2[t[index]] = s[index]
            } else if let v1 = map1[s[index]], let v2 = map2[t[index]] {
                if v1 != t[index] { return false }
                if v2 != s[index] { return false }
            } else {
                return false
            }
        }
        return true
    }
}
