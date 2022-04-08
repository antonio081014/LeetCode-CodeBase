// Date: Fri Apr  8 2022
class Solution {
    /// - Complexity:
    ///     - Time: O(n + m * (wlen + nLen)), where n = licensePlate.count, m = words.count, wlen is max length of all words, and nLen is number of unique characters in licensePlate.
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var dict = [Character: Int]()
        var minLen = 0
        for c in licensePlate.lowercased() {
            if c.isLetter {
                dict[c, default: 0] += 1
                minLen += 1
            }
        }
        var result: String? = nil
        for w in words {
            var dictw = [Character : Int]()
            for c in w {
                dictw[c, default: 0] += 1
            }
            
            var flag = false
            for (c, v) in dict {
                if v > dictw[c, default: 0] {
                    flag = true
                    break
                }
            }
            if flag == false, w.count >= minLen {
                if result == nil || ((result?.count) ?? 0) > w.count {
                    result = w
                }
            }
        }
        return result!
    }
}
