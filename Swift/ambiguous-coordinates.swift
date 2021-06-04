/**
 * https://leetcode.com/problems/ambiguous-coordinates/
 * 
 * 
 */ 
// Date: Thu Jun  3 17:26:19 PDT 2021
class Solution {
    func ambiguousCoordinates(_ s: String) -> [String] {
        let s = Array(s)
        // var dict: [String : Set<String>] = [:]
        var result = [String]()
        for divider in stride(from: 2, to: s.count - 1, by: 1) {
            let left = generate(s, 1, divider - 1)
            let right = generate(s, divider, s.count - 2)
            for l in left {
                for r in right {
                    result.append("(" + l + ", " + r + ")")
                }
            }
        }
        return result
    }

    func generate(_ s: [Character], _ start: Int, _ end: Int) -> Set<String> {
        var result = Set<String>()
        let text = String(Array(s[start ... end]))
        if String(Int(text)!) == text {
            result.insert(text)
        }
        for divider in stride(from: start + 1, through: end, by: 1) {
            let left = Array(s[start ..< divider])
            let right = Array(s[divider ... end])
            if s[end] != Character("0") && (String(left) == "0" || s[start] != Character("0")) {
                result.insert(String(left) + "." + String(right))
            }
        }
        return result
    }
}

