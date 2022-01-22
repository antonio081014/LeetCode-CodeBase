/**
 * https://leetcode.com/problems/divide-a-string-into-groups-of-size-k/
 * 
 * 
 */ 
// Date: Fri Jan 21 19:44:12 PST 2022
class Solution {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        var s = s
        if s.count % k != 0 {
            s.append(contentsOf: Array(repeating: fill, count: k - (s.count % k)))
        }
        var result = [String]()
        var tmp = ""
        var count = 0
        for c in s {
            tmp.append(c)
            count += 1
            if count == k {
                result.append(tmp)
                tmp = ""
                count = 0
            }
        }
        return result
    }
}