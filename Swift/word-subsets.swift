/**
 * https://leetcode.com/problems/word-subsets/
 * 
 * 
 */ 
// Date: Fri Mar 26 16:15:50 PDT 2021
class Solution {
    func wordSubsets(_ A: [String], _ B: [String]) -> [String] {
        var map: [Character : Int] = [:]
        for b in B {
            for (key, value) in buildDict(b) {
                map[key] = max(map[key, default: 0], value)
            }
        }
        // print(map)

        var result: [String] = []

        for a in A {
            let dict = buildDict(a)
            var flag = false
            for (key, value) in map {
                if dict[key, default: 0] < value {
                    flag = true
                    break
                }
            }
            if flag == false {
                result.append(a)
            }
        }
        return result
    }

    private func buildDict(_ word: String) -> [Character : Int] {
        var result: [Character : Int] = [:]
        for c in word {
            result[c, default: 0] += 1
        }
        return result
    }
}
