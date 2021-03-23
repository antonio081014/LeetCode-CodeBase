/**
 * https://leetcode.com/problems/vowel-spellchecker/
 * 
 * 
 */ 
// Date: Tue Mar 23 09:41:09 PDT 2021
class Solution {
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        let list = Set(wordlist)
        var vowels: [String : String] = [:]
        var caps: [String : String] = [:]
        for word in wordlist {
            if caps[word.lowercased()] == nil {
                caps[word.lowercased()] = word
            }
            let vtext = convertedWord(word)
            if vowels[vtext] == nil {
                vowels[vtext] = word
            }
        }
        var result: [String] = []
        for qword in queries {
            if list.contains(qword) {
                result.append(qword)
            } else if let text = caps[qword.lowercased()] {
                result.append(text)
            } else if let text = vowels[convertedWord(qword)] {
                result.append(text)
            } else {
                result.append("")
            }
        }
        return result
    }

    private func convertedWord(_ word: String) -> String {
        return String(Array(word.lowercased()).map { "aeiou".contains($0) ? Character("#") : $0 })
    }
}