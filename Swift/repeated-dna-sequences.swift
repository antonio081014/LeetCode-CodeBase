/**
 * https://leetcode.com/problems/repeated-dna-sequences/
 * 
 * 
 */ 
// Date: Thu Oct 29 10:54:27 PDT 2020
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        var result: Set<String> = []
        var visited: Set<String> = []
        let list = Array(s)
        for index in stride(from: 9, to: list.count, by: 1) {
            let text = String(list[index - 9 ... index])
            if visited.contains(text) {
                result.insert(text)
            }
            visited.insert(text)
        }
        return Array(result)
    }
}