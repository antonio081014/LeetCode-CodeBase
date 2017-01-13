/**
 * https://leetcode.com/problems/reverse-vowels-of-a-string/
 * 
 * 
 */ 
class Solution {
    func reverseVowels(_ s: String) -> String {
        var list = s.characters.map() {"\($0)"}
        var left = 0
        var right = list.count-1
        while left < right {
            if !isVowel(list[left]) {left += 1}
            else if !isVowel(list[right]) {right -= 1}
            else {
                let tmp = list[left]
                list[left] = list[right]
                list[right] = tmp
                left += 1
                right -= 1
            }
        }
        return list.joined()
    }
    
    private func isVowel(_ c: String) -> Bool {
        return "aeiouAEIOU".contains(c)
    }
}
