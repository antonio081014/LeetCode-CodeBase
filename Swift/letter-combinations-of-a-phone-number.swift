/**
 * Problem Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 *
 *
 */

class Solution {
    let dict = [
        1:["1"],
        2:["a", "b", "c"],
        3:["d", "e", "f"],
        4:["g", "h", "i"],
        5:["j", "k", "l"],
        6:["m", "n", "o"],
        7:["p", "q", "r", "s"],
        8:["t", "u", "v"],
        9:["w", "x", "y", "z"],
        0:["0"]
    ]
    func letterCombinations(_ digits: String) -> [String] {
        return Array(comb(digits.characters.map({Int(String($0))!})))
    }
    
    private func comb(_ digits: [Int]) -> Set<String> {
        var rSet = Set<String>()
        if digits.count == 0 {
            return rSet
        }
        if digits.count == 1 {
            rSet = Set<String>(dict[digits[0]]!)
            return rSet
        }
        let subSet = comb(Array(digits.dropFirst(1)))
        for c in dict[digits[0]]! {
            for s in subSet {
                rSet.insert(c + s)
            }
        }
        return rSet
    }
}
