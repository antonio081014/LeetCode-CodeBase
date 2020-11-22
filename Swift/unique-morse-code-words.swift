/**
 * https://leetcode.com/problems/unique-morse-code-words/
 * 
 * 
 */ 
// Date: Sun Nov 22 09:16:51 PST 2020
class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let code = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var result: Set<String> = []

        for word in words {
            var codeText = ""
            for c in word.unicodeScalars {
                codeText += code[Int(c.value) - 97]
            }
            result.insert(codeText)
        }
        return result.count
    }
}