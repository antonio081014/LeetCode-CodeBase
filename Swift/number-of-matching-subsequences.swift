/**
 * https://leetcode.com/problems/number-of-matching-subsequences/
 * 
 * 
 */ 
// Date: Tue Jun 22 14:58:43 PDT 2021
class Solution {
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var map: [Character : [Int]] = [:]
        for (index, c) in s.enumerated() {
            map[c, default: []].append(index)
        }
        // print(map)

        var result = 0
        for word in words {
            var start = -1
            var found = true
            for c in word {
                found = false
                if let list = map[c] {
                    let index = lower_bound(in: list, target: start)
                    // print(word, list, start, index)
                    if index != -1 {
                        start = index
                        found = true
                    }
                }
                if found == false {
                    break
                }
            }
            if found { 
                // print(word)
                result += 1
            }
        }
        return result
    }

    private func lower_bound(in list: [Int], target: Int) -> Int {
        var left = 0
        var right = list.count 
        while left < right {
            let mid = (right - left) / 2 + left
            if list[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        if left < list.count, list[left] > target {
            return list[left]
        }
        return -1
    }
}